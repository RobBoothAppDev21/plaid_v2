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

ActiveRecord::Schema[7.0].define(version: 2023_12_15_234819) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "item_id", null: false
    t.string "name"
    t.string "plaid_account_id"
    t.string "mask"
    t.string "currency_code"
    t.string "account_subtype"
    t.string "account_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_balance_cents", default: 0
    t.integer "available_balance_cents", default: 0
    t.integer "limit_cents", default: 0
    t.index ["item_id"], name: "index_accounts_on_item_id"
  end

  create_table "items", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plaid_item_id"
    t.string "bank_name"
    t.string "transactions_cursor"
    t.boolean "is_active"
    t.string "institution_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id", null: false
    t.uuid "account_id", null: false
    t.string "category"
    t.date "date"
    t.date "authorized_date"
    t.string "name"
    t.string "currency_code", default: "USD"
    t.boolean "is_removed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plaid_transaction_id"
    t.integer "amount_cents", default: 0
    t.string "category_detailed"
    t.string "category_primary"
    t.string "pending_transaction_id"
    t.string "logo_url"
    t.boolean "pending"
    t.index ["account_id"], name: "index_transactions_on_account_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accounts", "items"
  add_foreign_key "items", "users"
  add_foreign_key "transactions", "accounts"
  add_foreign_key "transactions", "users"
end
