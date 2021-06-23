class Route < ApplicationRecord
  belongs_to :vehicle, optional: true
  validates :date, :size, presence: true
  validates :size, numericality: { greater_than: 0 }

  before_create :check_constraints, if: -> { vehicle }
  before_update :check_constraints, if: -> { vehicle }
  after_create :inform_vehicle, if: -> { vehicle }
  after_update :inform_vehicle, if: -> { vehicle }

  def info
    "Data: #{date} - Tamanho #{size} (Km's)"
  end

  private

  def check_constraints
    vehicle_data = vehicle.next_maintenance_data
    if vehicle_data[:kms_until] < size
      error_mesage = "o veículo precisará entrar em manutenção em #{vehicle_data[:kms_until]} kms"
      errors.add(:size, error_mesage)
      raise ActiveRecord::RecordInvalid
    end

    if vehicle.max_autonomy < size
      errors.add(:size, "a autonomia do veículo é inferior")
      raise ActiveRecord::RecordInvalid
    end

    if vehicle.current_autonomy < size
      errors.add(:size, "o veículo não possui combustível suficiente")
      raise ActiveRecord::RecordInvalid
    end
  end

  def inform_vehicle
    vehicle.accept_route(size)
  end
end
