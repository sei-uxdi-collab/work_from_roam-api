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

ActiveRecord::Schema.define(version: 2020_04_12_035721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "examples", force: :cascade do |t|
    t.text "text", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_examples_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "note"
    t.bigint "user_id"
    t.bigint "work_space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "review"
    t.integer "wifi"
    t.integer "seating"
    t.integer "coffee"
    t.integer "food"
    t.integer "outlet"
    t.integer "noise"
    t.integer "bathroom"
    t.index ["user_id"], name: "index_reviews_on_user_id"
    t.index ["work_space_id"], name: "index_reviews_on_work_space_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  create_table "work_spaces", force: :cascade do |t|
    t.string "place_id"
    t.float "lat"
    t.float "lng"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "address"
    t.string "photo"
    t.index ["user_id"], name: "index_work_spaces_on_user_id"
  end

  add_foreign_key "examples", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "work_spaces"
  add_foreign_key "work_spaces", "users"
end
