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

ActiveRecord::Schema.define(version: 20160410111508) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dietary_restrictions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dish_id"
    t.string   "vegan"
    t.string   "vegetarian"
    t.string   "gluten"
    t.string   "lactose"
    t.string   "egg"
    t.string   "fish"
    t.string   "shellfish"
    t.string   "peanuts"
    t.string   "tree_nuts"
    t.string   "soy"
    t.string   "kosher"
    t.string   "halal"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dishes", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "quantity"
    t.string   "servings"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dish_id"
    t.integer  "address_id"
    t.string   "name"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_hash"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
