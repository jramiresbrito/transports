class CreateFuelTanks < ActiveRecord::Migration[6.0]
  def change
    create_table :fuel_tanks do |t|
      t.decimal :capacity, precision: 10, scale: 2
      t.decimal :amount, precision: 10, scale: 2
      t.integer :fuel

      t.timestamps
    end
  end
end
