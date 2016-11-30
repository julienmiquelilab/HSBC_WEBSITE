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

ActiveRecord::Schema.define(version: 20161130143728) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string  "kind"
    t.integer "overdraft_max"
    t.integer "overdraft_min"
    t.integer "rate"
    t.integer "celling"
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "balance"
    t.integer "overdraft_value_max"
    t.integer "account_type_id"
    t.integer "client_id"
    t.integer "card_type_id"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "advisors", force: :cascade do |t|
    t.string  "lastname"
    t.string  "firstname"
    t.string  "email"
    t.string  "phone_number"
    t.integer "agency_id"
  end

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
  end

  create_table "card_types", force: :cascade do |t|
    t.string "kind"
    t.text   "advantages"
  end

  create_table "clients", force: :cascade do |t|
    t.string  "lastname"
    t.string  "firstname"
    t.date    "birthdate"
    t.string  "email"
    t.string  "login"
    t.string  "password"
    t.integer "agency_id"
    t.integer "advisor_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string   "action"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "speech"
    t.text     "display_text"
    t.string   "data"
    t.string   "source"
    t.string   "parameter_value"
  end

  create_table "transfers", force: :cascade do |t|
    t.integer "amount"
    t.text    "description"
    t.integer "receiver_account_id"
    t.integer "sender_account_id"
  end

end
