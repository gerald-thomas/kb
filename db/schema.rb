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

ActiveRecord::Schema.define(version: 20150809131940) do

  create_table "rules", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "excel",      limit: 65535
    t.text     "test",       limit: 65535
    t.boolean  "branch"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "ancestry",   limit: 255
  end

  add_index "rules", ["ancestry"], name: "index_rules_on_ancestry", using: :btree

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
  end

end
