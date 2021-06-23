class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.datetime :date
      t.integer :size
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
