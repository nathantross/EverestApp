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

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20140225230032) do
=======
ActiveRecord::Schema.define(version: 20140226014053) do
>>>>>>> 041caaf9370bdfa2e99fde4431f316ef85950f20
=======
ActiveRecord::Schema.define(version: 20140226014053) do
>>>>>>> 041caaf9370bdfa2e99fde4431f316ef85950f20

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goals", force: true do |t|
    t.string   "name"
    t.string   "input_interpretation"
    t.float    "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "distance"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.integer  "goal_id"
    t.text     "start_date"
  end

  add_index "users", ["goal_id"], name: "index_users_on_goal_id", using: :btree

end
