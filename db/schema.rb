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

ActiveRecord::Schema[7.0].define(version: 2023_12_05_192250) do
  create_table "adoptions", force: :cascade do |t|
    t.string "name"
    t.string "race"
    t.string "size"
    t.string "sex"
    t.text "description"
    t.text "situation"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "finished"
    t.datetime "confirmed_at", precision: nil
    t.string "age"
    t.index ["user_id"], name: "index_adoptions_on_user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "time"
    t.integer "state", default: 0
    t.text "message", default: ""
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "query_type"
    t.integer "dog_id"
    t.index ["dog_id"], name: "index_appointments_on_dog_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "caregivers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.text "phoneNum"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "zone"
    t.string "services"
    t.index ["user_id"], name: "index_caregivers_on_user_id"
  end

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.string "gender"
    t.date "birthdate"
    t.integer "age"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_dogs_on_user_id"
  end

  create_table "donations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "closing_date"
    t.decimal "target_amount"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "surname", default: "", null: false
    t.text "phoneNum"
    t.string "dni", default: "", null: false
    t.boolean "firstLogin", default: true
    t.integer "caregiver_id"
    t.integer "walker_id"
    t.index ["caregiver_id"], name: "index_users_on_caregiver_id"
    t.index ["dni"], name: "index_users_on_dni", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["walker_id"], name: "index_users_on_walker_id"
  end

  create_table "walkers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.text "phoneNum"
    t.string "email"
    t.string "zone"
    t.time "start"
    t.time "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_walkers_on_user_id"
  end

  add_foreign_key "adoptions", "users"
  add_foreign_key "appointments", "dogs"
  add_foreign_key "appointments", "users"
  add_foreign_key "caregivers", "users"
  add_foreign_key "dogs", "users"
  add_foreign_key "users", "caregivers"
  add_foreign_key "users", "walkers"
  add_foreign_key "walkers", "users"
end
