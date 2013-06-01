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

ActiveRecord::Schema.define(version: 20130513050159) do

  create_table "logins", force: true do |t|
    t.string   "name",            limit: 100
    t.string   "email",           limit: 100
    t.string   "password",        limit: 10
    t.boolean  "record_del_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todos", force: true do |t|
    t.string   "todo_text",       limit: 160
    t.boolean  "complete"
    t.boolean  "record_del_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user"
  end

end
