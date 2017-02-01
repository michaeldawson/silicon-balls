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

ActiveRecord::Schema.define(version: 20170201090459) do

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "pitches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "problem",         limit: 65535
    t.text     "solution",        limit: 65535
    t.text     "target_market",   limit: 65535
    t.text     "revenue_streams", limit: 65535
    t.text     "channels",        limit: 65535
    t.text     "traction",        limit: 65535
    t.text     "funding",         limit: 65535
    t.text     "team",            limit: 65535
    t.text     "other",           limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "team_members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "expertise"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
