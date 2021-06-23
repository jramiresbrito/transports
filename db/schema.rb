# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_20_143753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fuel_tanks", force: :cascade do |t|
    t.decimal "capacity", precision: 10, scale: 2
    t.decimal "amount", precision: 10, scale: 2
    t.integer "fuel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.datetime "date"
    t.integer "distance_traveled"
    t.decimal "price", precision: 10, scale: 2
    t.integer "tipo"
    t.bigint "vehicle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vehicle_id"], name: "index_maintenances_on_vehicle_id"
  end

  create_table "routes", force: :cascade do |t|
    t.datetime "date"
    t.integer "size"
    t.bigint "vehicle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["vehicle_id"], name: "index_routes_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "plate"
    t.integer "tipo"
    t.bigint "fuel_tank_id"
    t.decimal "fuel_cost", precision: 10, scale: 2
    t.integer "distance_traveled"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fuel_tank_id"], name: "index_vehicles_on_fuel_tank_id"
  end

  add_foreign_key "maintenances", "vehicles"
  add_foreign_key "routes", "vehicles"
  add_foreign_key "vehicles", "fuel_tanks"
end
