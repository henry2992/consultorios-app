# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170708213036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "appointment_schedules", force: :cascade do |t|
    t.integer  "appointment_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["appointment_id"], name: "index_appointment_schedules_on_appointment_id", using: :btree
  end

  create_table "appointments", force: :cascade do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.text     "description"
    t.decimal  "price",       precision: 8, scale: 3
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "balance_sheet_entries", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.date     "transaction_date"
    t.integer  "payment_status",   default: 0
    t.integer  "clinic_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["clinic_id"], name: "index_balance_sheet_entries_on_clinic_id", using: :btree
  end

  create_table "balance_sheet_entry_details", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "amount",                 precision: 10, scale: 2
    t.integer  "transaction_type_id"
    t.integer  "balance_sheet_entry_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["balance_sheet_entry_id"], name: "index_balance_sheet_entry_details_on_balance_sheet_entry_id", using: :btree
    t.index ["transaction_type_id"], name: "index_balance_sheet_entry_details_on_transaction_type_id", using: :btree
  end

  create_table "clinics", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "status",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "price"
    t.date     "expiration_date"
    t.string   "characteristics"
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "transaction_types", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "accounting_flow", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "deferred",        default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.integer  "clinic_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",                   default: "Patient"
    t.text     "address"
    t.string   "phone"
    t.integer  "doctor_id"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.string   "national_id"
    t.string   "pob"
    t.date     "dob"
    t.string   "cellphone"
    t.string   "office_phone"
    t.integer  "gender",                 default: 0
    t.index ["clinic_id"], name: "index_users_on_clinic_id", using: :btree
    t.index ["doctor_id"], name: "index_users_on_doctor_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointment_schedules", "appointments"
  add_foreign_key "balance_sheet_entries", "clinics"
  add_foreign_key "balance_sheet_entry_details", "balance_sheet_entries"
  add_foreign_key "balance_sheet_entry_details", "transaction_types"
end
