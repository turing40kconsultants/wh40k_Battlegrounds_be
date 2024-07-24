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

ActiveRecord::Schema[7.1].define(version: 2024_07_24_004934) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "melee_weapons", force: :cascade do |t|
    t.string "name"
    t.integer "attacks"
    t.integer "ws"
    t.integer "strength"
    t.integer "ap"
    t.integer "damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "movement"
    t.integer "toughness"
    t.integer "sv"
    t.integer "invul_sv"
    t.integer "wounds"
    t.integer "original_wounds"
    t.integer "leadership"
    t.integer "objective_control"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
