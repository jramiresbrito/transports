class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.integer :tipo
      t.references :fuel_tank, foreign_key: true
      t.decimal :fuel_cost, precision: 10, scale: 2
      t.integer :distance_traveled

      t.timestamps
    end
  end
end
