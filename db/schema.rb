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

ActiveRecord::Schema.define(version: 20151223175555) do

  create_table "auth_tokens", force: :cascade do |t|
    t.string   "token",      limit: 255
    t.boolean  "active",                 default: true
    t.date     "expires_at"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id", limit: 4, null: false
    t.integer  "followee_id", limit: 4, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["follower_id", "followee_id"], name: "index_relationships_on_follower_id_and_followee_id", unique: true, using: :btree

  create_table "thanks", force: :cascade do |t|
    t.string   "to_whom",    limit: 255
    t.string   "to_what",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "thanks_id",        limit: 255
    t.string   "name",             limit: 255
    t.string   "crypted_password", limit: 255
    t.string   "salt",             limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar",           limit: 255
    t.string   "profile",          limit: 255
  end

  add_index "users", ["thanks_id"], name: "index_users_on_thanks_id", unique: true, using: :btree

end
