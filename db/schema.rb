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

ActiveRecord::Schema.define(version: 20150330181406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_controls", force: :cascade do |t|
    t.integer  "doorbot_id"
    t.integer  "credential_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "access_controls", ["credential_id"], name: "index_access_controls_on_credential_id", using: :btree
  add_index "access_controls", ["doorbot_id"], name: "index_access_controls_on_doorbot_id", using: :btree

  create_table "access_requests", force: :cascade do |t|
    t.string   "form"
    t.string   "key"
    t.integer  "doorbot_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "access_granted", default: false
  end

  add_index "access_requests", ["doorbot_id"], name: "index_access_requests_on_doorbot_id", using: :btree

  create_table "credentials", force: :cascade do |t|
    t.integer  "form"
    t.string   "nickname",   limit: 255
    t.string   "key",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "doorbots", force: :cascade do |t|
    t.string   "nickname",   limit: 255
    t.string   "api_key",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "doorbots", ["api_key"], name: "index_doorbots_on_api_key", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",                    default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
