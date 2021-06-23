print 'Cleaning current data...'
Vehicle.destroy_all
FuelTank.destroy_all
puts 'Ok'.green

print 'Creating Fuel tanks...'
a1 = FuelTank.create(capacity: 50, amount: 50, fuel: 'alcool')
a2 = FuelTank.create(capacity: 60, amount: 60, fuel: 'alcool')
a3 = FuelTank.create(capacity: 80, amount: 80, fuel: 'alcool')
a4 = FuelTank.create(capacity: 250, amount: 250, fuel: 'alcool')

d1 = FuelTank.create(capacity: 50, amount: 50, fuel: 'diesel')
d2 = FuelTank.create(capacity: 60, amount: 60, fuel: 'diesel')
d3 = FuelTank.create(capacity: 80, amount: 80, fuel: 'diesel')
d4 = FuelTank.create(capacity: 250, amount: 250, fuel: 'diesel')

g1 = FuelTank.create(capacity: 50, amount: 50, fuel: 'gasolina')
g2 = FuelTank.create(capacity: 60, amount: 60, fuel: 'gasolina')
g3 = FuelTank.create(capacity: 80, amount: 80, fuel: 'gasolina')
g4 = FuelTank.create(capacity: 250, amount: 250, fuel: 'gasolina')
puts 'Ok'.green

print 'Creating Vehicles...'
def generate_plate
  "#{('A'..'Z').to_a.sample(3).join}-#{(0..9).to_a.sample(4).join}"
end
Vehicle.create(plate: generate_plate, tipo: "Caminhão", fuel_tank_id: d4.id, fuel_cost: 0, distance_traveled: 0)
Vehicle.create(plate: generate_plate, tipo: "Van", fuel_tank_id: d3.id, fuel_cost: 0, distance_traveled: 0)
Vehicle.create(plate: generate_plate, tipo: "Furgão", fuel_tank_id: g3.id, fuel_cost: 0, distance_traveled: 0)
Vehicle.create(plate: generate_plate, tipo: "Carro", fuel_tank_id: a3.id, fuel_cost: 0, distance_traveled: 0)
puts 'Ok'.green
puts 'DONE!'.green
