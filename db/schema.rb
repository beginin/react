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

ActiveRecord::Schema.define(version: 20130904142741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: true do |t|
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reactions", force: true do |t|
    t.string   "reaction"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "specialties", force: true do |t|
    t.string   "specialty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stimulreactions", force: true do |t|
    t.integer  "worksheet_id"
    t.integer  "reaction_id"
    t.integer  "stimul_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stimuls", force: true do |t|
    t.string   "stimul"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "worksheets", force: true do |t|
    t.boolean  "sex"
    t.integer  "age"
    t.integer  "language_id"
    t.integer  "specialty_id"
    t.date     "dateinput"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "number"
  end

end
