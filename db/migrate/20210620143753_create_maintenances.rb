class CreateMaintenances < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.datetime :date
      t.integer :distance_traveled
      t.decimal :price, precision: 10, scale: 2
      t.integer :tipo
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
