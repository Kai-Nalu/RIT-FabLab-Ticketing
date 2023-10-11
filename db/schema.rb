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

ActiveRecord::Schema[7.0].define(version: 4) do
  create_table "m_processes", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.string "units"
    t.decimal "time_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string "name"
    t.integer "m_process_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["m_process_id"], name: "index_machines_on_m_process_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.boolean "in_stock"
    t.decimal "quantity_cost"
    t.integer "m_process_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["m_process_id"], name: "index_materials_on_m_process_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "machines", "m_processes"
  add_foreign_key "materials", "m_processes"
end
