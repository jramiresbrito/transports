class FuelTank < ApplicationRecord
  include FuelData

  validates :capacity, :amount, :fuel, presence: true
  validates :capacity, numericality: { greater_than: 0 }
  validates :amount, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: :capacity,
    message: "deve estar entre 0 e o valor da capacidade"
  }

  enum fuel: { diesel: 1, alcool: 2, gasolina: 3 }

  def info
    message = "Capacidade: #{capacity} (L) - "
    message += "Quantidade: #{amount} (L) - "
    message += "Combustível: #{fuel}"

    message
  end

  def travel(distance)
    fuel_data = current_fuel_data
    self.amount -= (distance.to_f / fuel_data[:autonomy])

    save!
  end

  # returns an float representing the max autonomy in kms. eg: 400 meaning 400 kms
  def max_autonomy
    fuel_data = current_fuel_data

    (capacity * fuel_data[:autonomy]).to_f
  end

  # returns an float representing the current autonomy in kms. eg: 400 meaning 400 kms
  def current_autonomy
    fuel_data = current_fuel_data

    (self.amount * fuel_data[:autonomy]).to_f
  end

  # returns an hash having the autonomy and price per L considering the fuel type
  def current_fuel_data
    return FuelData::ALCOHOL if fuel.upcase == "ALCOOL"
    return FuelData::GASOLINE if fuel.upcase == "GASOLINA"
    return FuelData::DIESEL if fuel.upcase == "DIESEL"
  end
end
