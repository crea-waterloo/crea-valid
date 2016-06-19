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

ActiveRecord::Schema.define(version: 20160614170509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "filtered_relations", force: :cascade do |t|
    t.string  "subject",   null: false
    t.string  "predicate", null: false
    t.string  "object",    null: false
    t.integer "keyword"
    t.string  "link"
  end

  create_table "pubmed_abstracts", id: :bigserial, force: :cascade do |t|
    t.integer "pmid",         null: false
    t.text    "title",        null: false
    t.text    "authors",      null: false
    t.text    "search_term",  null: false
    t.text    "section_name", null: false
    t.text    "section_body", null: false
  end

  create_table "relation_ratings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "relation_id"
    t.integer  "value"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relation_ratings", ["relation_id"], name: "index_relation_ratings_on_relation_id", using: :btree
  add_index "relation_ratings", ["user_id"], name: "index_relation_ratings_on_user_id", using: :btree

  create_table "relations", force: :cascade do |t|
    t.string   "subject"
    t.string   "predicate"
    t.string   "object"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "relation_ratings", "relations"
  add_foreign_key "relation_ratings", "users"
end
