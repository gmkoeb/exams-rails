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

ActiveRecord::Schema[7.1].define(version: 2024_04_16_212707) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "crm"
    t.string "crm_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["crm", "crm_state"], name: "index_doctors_on_crm_and_crm_state", unique: true
    t.index ["email"], name: "index_doctors_on_email", unique: true
  end

  create_table "exams", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "doctor_id", null: false
    t.string "token"
    t.datetime "date"
    t.string "exam_type"
    t.string "type_limits"
    t.string "type_result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_exams_on_doctor_id"
    t.index ["exam_type", "token"], name: "index_exams_on_exam_type_and_token", unique: true
    t.index ["patient_id"], name: "index_exams_on_patient_id"
  end

  create_table "job_statuses", force: :cascade do |t|
    t.string "token"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "processed_rows"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "registration_number"
    t.string "birth_date"
    t.string "address"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["registration_number"], name: "index_patients_on_registration_number", unique: true
  end

  add_foreign_key "exams", "doctors"
  add_foreign_key "exams", "patients"
end
