class Vehicle < ApplicationRecord
  include MaintenanceCategories

  belongs_to :fuel_tank
  has_many :routes, dependent: :destroy
  has_many :maintenances, dependent: :destroy

  validates :plate, :distance_traveled, :tipo, presence: true
  validates :fuel_cost, numericality: { greater_than_or_equal_to: 0 }
  validates :distance_traveled, numericality: { greater_than_or_equal_to: 0 }

  enum tipo: { "Caminhão": 1, "Van": 2, "Furgão": 3, "Carro": 4 }

  def info
    "#{tipo} com placa #{plate}"
  end

  # returns an float representing the max autonomy in kms. eg: 400 meaning 400 kms
  def max_autonomy
    fuel_tank.max_autonomy
  end

  # returns an float representing the current autonomy in kms. eg: 400 meaning 400 kms
  def current_autonomy
    fuel_tank.current_autonomy
  end

  # returns an hash having the autonomy and price per L considering the fuel type
  def current_fuel_data
    fuel_tank.current_fuel_data
  end

  # returns an hash having the following data related to the next maintenance:
  # kms to it, maintenance messages
  def next_maintenance_data
    periodic = calc_distance(:periodic)
    parts_change = calc_distance(:parts_change)

    if periodic < parts_change
      return { kms_until: periodic, message: MaintenanceCategories::MESSAGE[:periodic], amount: 1 }
    end
    if parts_change < periodic
      return { kms_until: parts_change, message: MaintenanceCategories::MESSAGE[:parts_change], amount: 1 }
    end

    return { kms_until: periodic,
             message: "#{MaintenanceCategories::MESSAGE[:periodic]} - #{MaintenanceCategories::MESSAGE[:parts_change]}",
             amount: 2 }
  end

  def maintenance_category
    return MaintenanceCategories::SIZE_250 if fuel_tank.capacity.to_f >= 250
    return MaintenanceCategories::SIZE_80 if fuel_tank.capacity.to_f >= 80
    return MaintenanceCategories::SIZE_60 if fuel_tank.capacity.to_f >= 60

    return MaintenanceCategories::SIZE_50
  end

  def accept_route(route_size)
    verify_maintenance(route_size)
    self.distance_traveled += route_size
    fuel_tank.travel(route_size)
    fuel_data = current_fuel_data
    self.fuel_cost += (route_size.to_f / fuel_data[:autonomy]) * fuel_data[:price]
    save!
  end

  def maintenances_cost
    cost = 0
    maintenances.each do |maintenance|
      cost += maintenance.price
    end
    cost
  end

  private

  # auxiliary method to calculate the distance depending on the symbol passed
  def calc_distance(type)
    category = maintenance_category

    category[type] - (distance_traveled % category[type])
  end

  def verify_maintenance(additional_distance)
    if additional_distance >= next_maintenance_data[:kms_until] # should have a maintenance
      next_maintenance_data[:amount].times do
        add_maintenance
      end
    end
  end

  def add_maintenance
    Maintenance.create(date: Date.tomorrow, vehicle_id: id)
  end
end
