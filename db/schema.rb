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

ActiveRecord::Schema.define(version: 20170228200501) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "author"
    t.boolean  "approved"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "actors"
    t.string   "genres"
    t.string   "writers"
    t.integer  "runtime"
    t.string   "director"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "cover_img_file_name"
    t.string   "cover_img_content_type"
    t.integer  "cover_img_file_size"
    t.datetime "cover_img_updated_at"
    t.integer  "ratingcounter"
    t.string   "yt_trailer_url"
    t.date     "release_date"
    t.float    "avgrating"
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.date     "date_of_birth"
    t.string   "place_of_birth"
    t.text     "bio"
    t.string   "martial_status"
    t.integer  "height"
    t.text     "nicknames"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "people_movies", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "person_id"
    t.text     "roles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.text     "thoughts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slideshow_pics", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "destination_type"
    t.integer  "destination_id"
    t.string   "destination_url"
  end

  create_table "slideshows", force: :cascade do |t|
    t.integer "destination_id"
    t.integer "destination_type"
  end

  create_table "trivia", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "context"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "privilege"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
