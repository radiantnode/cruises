# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_02_163814) do
  create_table "cruise_events", force: :cascade do |t|
    t.date "date"
    t.integer "event_type", default: 0
    t.integer "cruise_id"
    t.integer "port_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cruise_id"], name: "index_cruise_events_on_cruise_id"
    t.index ["port_id"], name: "index_cruise_events_on_port_id"
  end

  create_table "cruiselines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cruises", force: :cascade do |t|
    t.string "name"
    t.string "cabin"
    t.integer "cruiseline_id"
    t.integer "ship_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cruiseline_id"], name: "index_cruises_on_cruiseline_id"
    t.index ["ship_id"], name: "index_cruises_on_ship_id"
  end

  create_table "ports", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.integer "cruiseline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cruiseline_id"], name: "index_ships_on_cruiseline_id"
  end

  add_foreign_key "cruise_events", "cruises"
  add_foreign_key "cruise_events", "ports"
  add_foreign_key "cruises", "cruiselines"
  add_foreign_key "cruises", "ships"
  add_foreign_key "ships", "cruiselines"
end
