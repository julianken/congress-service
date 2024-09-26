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

ActiveRecord::Schema[7.1].define(version: 2024_09_26_015647) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "representatives", force: :cascade do |t|
    t.string "name"
    t.string "chamber"
    t.string "bioguide_id"
    t.boolean "current_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "state_id", null: false
    t.index ["bioguide_id"], name: "index_representatives_on_bioguide_id", unique: true
    t.index ["state_id"], name: "index_representatives_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abbreviation"], name: "index_states_on_abbreviation", unique: true
  end

  add_foreign_key "representatives", "states"
end
