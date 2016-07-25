# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160724024132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "complete_transactions", force: :cascade do |t|
    t.date     "f_date"
    t.string   "f_type"
    t.integer  "f_quantity"
    t.decimal  "f_total_sell"
    t.decimal  "f_unit_sell"
    t.string   "f_buyer"
    t.integer  "complete_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "complete_transactions", ["complete_id"], name: "index_complete_transactions_on_complete_id", using: :btree

  create_table "completes", force: :cascade do |t|
    t.string   "name"
    t.string   "unit"
    t.integer  "minimum_stock"
    t.integer  "current_stock"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "completes", ["user_id"], name: "index_completes_on_user_id", using: :btree

  create_table "expense_transactions", force: :cascade do |t|
    t.date     "e_date"
    t.decimal  "e_total_price"
    t.text     "e_note"
    t.integer  "expense_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "e_type"
  end

  add_index "expense_transactions", ["expense_id"], name: "index_expense_transactions_on_expense_id", using: :btree

  create_table "expenses", force: :cascade do |t|
    t.string   "e_category"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id", using: :btree

  create_table "materials", force: :cascade do |t|
    t.string   "name"
    t.string   "unit"
    t.integer  "minimum_stock"
    t.integer  "current_stock"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "materials", ["user_id"], name: "index_materials_on_user_id", using: :btree

  create_table "profits", force: :cascade do |t|
    t.date     "p_date"
    t.decimal  "p_profit"
    t.integer  "raw_transaction_id"
    t.integer  "complete_transaction_id"
    t.integer  "expense_transaction_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.date     "r_date"
    t.decimal  "r_profit"
  end

  add_index "profits", ["complete_transaction_id"], name: "index_profits_on_complete_transaction_id", using: :btree
  add_index "profits", ["expense_transaction_id"], name: "index_profits_on_expense_transaction_id", using: :btree
  add_index "profits", ["raw_transaction_id"], name: "index_profits_on_raw_transaction_id", using: :btree

  create_table "raw_transactions", force: :cascade do |t|
    t.date     "t_date"
    t.string   "t_type"
    t.integer  "t_quantity"
    t.decimal  "t_total_price"
    t.decimal  "t_price_unit"
    t.string   "t_supplier"
    t.integer  "material_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "raw_transactions", ["material_id"], name: "index_raw_transactions_on_material_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "business_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "complete_transactions", "completes"
  add_foreign_key "completes", "users"
  add_foreign_key "expense_transactions", "expenses"
  add_foreign_key "expenses", "users"
  add_foreign_key "materials", "users"
  add_foreign_key "profits", "complete_transactions"
  add_foreign_key "profits", "expense_transactions"
  add_foreign_key "profits", "raw_transactions"
  add_foreign_key "raw_transactions", "materials"
end
