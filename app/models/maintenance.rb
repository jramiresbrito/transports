class Maintenance < ApplicationRecord
  belongs_to :vehicle, optional: true

  validates :date, presence: true
  validates :distance_traveled, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  enum tipo: { longa: 1, "média": 2, curta: 3 } # keyword type is reserved
  after_create :set_data, if: -> { vehicle }

  def info
    "Data: #{date} - Tipo: #{tipo} - Distância Percorrida: #{distance_traveled} (Km's)"
  end

  private

  def set_data
    define_tipo
    define_price
    define_distance
    save!
  end

  def define_tipo
    self.tipo = 1 if vehicle.distance_traveled > 20_000
    self.tipo = 2 if vehicle.distance_traveled < 20_000
    self.tipo = 3 if vehicle.distance_traveled < 10_000
  end

  def define_price
    self.price = 3000.0 if tipo == "longa"
    self.price = 1500.0 if tipo == "média"
    self.price = 500.0 if tipo == "curta"
  end

  def define_distance
    self.distance_traveled = vehicle.distance_traveled
  end
end
