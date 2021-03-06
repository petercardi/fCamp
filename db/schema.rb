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

ActiveRecord::Schema.define(version: 20150410232555) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "qcomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "quote_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "quotation"
    t.string   "author"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rcomments", force: :cascade do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.string   "hours"
    t.string   "website"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "beer"
    t.boolean  "wine"
    t.boolean  "full_bar"
    t.boolean  "vegetarian"
    t.boolean  "vegan"
    t.integer  "price_range"
    t.boolean  "quick"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "header"
    t.float    "rating"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "password_digest"
    t.string   "likes"
    t.string   "dislikes"
  end

end
