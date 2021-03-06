# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_02_160356) do

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.string "name"
    t.string "email"
    t.text "body"
    t.integer "external_uuid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["external_uuid"], name: "index_comments_on_external_uuid"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "name"
    t.integer "external_uuid"
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["external_uuid"], name: "index_posts_on_external_uuid"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.integer "user_id"
    t.string "street"
    t.string "suite"
    t.string "city"
    t.string "zipcode"
    t.float "geo_lat"
    t.float "geo_lng"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_companies", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "catch_phrase"
    t.string "bs"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_companies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
