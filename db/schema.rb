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

ActiveRecord::Schema[7.0].define(version: 2024_03_01_094730) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "pf_no"
    t.string "job_grade_period"
    t.string "job_grade"
    t.date "employment_date"
    t.string "department"
    t.string "title"
    t.bigint "supervisor_id"
    t.string "rank"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supervisor_id"], name: "index_employees_on_supervisor_id"
  end

  create_table "kpis", force: :cascade do |t|
    t.bigint "objective_id", null: false
    t.integer "baseline"
    t.integer "annual_target"
    t.float "weighted_rating"
    t.text "initiatives"
    t.string "name"
    t.text "supervisor_comment"
    t.text "employee_comment"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["objective_id"], name: "index_kpis_on_objective_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.string "name"
    t.date "planning_year"
    t.float "total_weight_percent"
    t.bigint "supervisor_id"
    t.string "status"
    t.date "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employees", "employees", column: "supervisor_id"
  add_foreign_key "kpis", "objectives"
  add_foreign_key "objectives", "employees", column: "supervisor_id", on_delete: :cascade
end
