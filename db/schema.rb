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

ActiveRecord::Schema.define(version: 2021_12_29_162547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.datetime "date_added"
    t.datetime "date_removed"
    t.bigint "business_asset_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_asset_id"], name: "index_accesses_on_business_asset_id"
    t.index ["employee_id"], name: "index_accesses_on_employee_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "business_assets", force: :cascade do |t|
    t.string "asset_code"
    t.decimal "cost"
    t.string "cost_type"
    t.string "name", null: false
    t.bigint "info_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "host_type_id"
    t.bigint "admin_id"
    t.bigint "priority_id"
    t.index ["admin_id"], name: "index_business_assets_on_admin_id"
    t.index ["host_type_id"], name: "index_business_assets_on_host_type_id"
    t.index ["info_type_id"], name: "index_business_assets_on_info_type_id"
    t.index ["priority_id"], name: "index_business_assets_on_priority_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "surname"
    t.string "email"
    t.string "phone_number"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employees_on_company_id"
  end

  create_table "host_types", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "info_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "priorities", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accesses", "business_assets"
  add_foreign_key "accesses", "employees"
  add_foreign_key "business_assets", "admins"
  add_foreign_key "business_assets", "host_types"
  add_foreign_key "business_assets", "info_types"
  add_foreign_key "business_assets", "priorities"
  add_foreign_key "employees", "companies"
end
