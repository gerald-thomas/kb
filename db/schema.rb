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

ActiveRecord::Schema.define(version: 20150903120535) do

  create_table "bins", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "rule",       limit: 4
    t.boolean  "branch"
    t.string   "ticket",     limit: 30
    t.integer  "ticketID",   limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "rules", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "excel",          limit: 65535
    t.text     "test",           limit: 65535
    t.boolean  "branch"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "ancestry",       limit: 255
    t.integer  "count_positive", limit: 4,     default: 0
    t.integer  "count_negative", limit: 4,     default: 0
  end

  add_index "rules", ["ancestry"], name: "index_rules_on_ancestry", using: :btree

  create_table "tests", force: :cascade do |t|
    t.boolean  "result"
    t.integer  "rule_id",    limit: 4
    t.integer  "ticket_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "tests", ["rule_id"], name: "index_tests_on_rule_id", using: :btree
  add_index "tests", ["ticket_id"], name: "index_tests_on_ticket_id", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.string   "ticket",     limit: 255
    t.boolean  "test1"
    t.boolean  "test2"
    t.boolean  "test3"
    t.boolean  "test4"
    t.boolean  "test5"
    t.boolean  "test6"
    t.boolean  "test7"
    t.boolean  "test8"
    t.boolean  "test9"
    t.boolean  "test10"
    t.boolean  "branch"
    t.integer  "rule",       limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "test_id",    limit: 4
  end

  add_index "tickets", ["test_id"], name: "index_tickets_on_test_id", using: :btree

  add_foreign_key "tests", "rules"
  add_foreign_key "tests", "tickets"
  add_foreign_key "tickets", "tests"
end
