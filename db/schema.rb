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

ActiveRecord::Schema.define(version: 20131017184854) do

  create_table "comments", force: true do |t|
    t.string   "message"
    t.integer  "likes",      default: 0
    t.datetime "updated_at"
    t.string   "from"
    t.integer  "post_id"
    t.datetime "created_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "opinions", force: true do |t|
    t.text     "nickname"
    t.text     "about"
    t.integer  "tag_id"
    t.integer  "delta_days", default: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "opinions", ["nickname"], name: "index_opinions_on_nickname", unique: true

  create_table "posts", force: true do |t|
    t.string   "message"
    t.integer  "likes",        default: 0,  null: false
    t.string   "pic_url",      default: "", null: false
    t.string   "from"
    t.integer  "opinion_id"
    t.datetime "updated_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "user_likes", force: true do |t|
    t.integer  "user_id"
    t.integer  "tag_id"
    t.integer  "read_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_likes", ["tag_id"], name: "index_user_likes_on_tag_id"
  add_index "user_likes", ["user_id"], name: "index_user_likes_on_user_id"

  create_table "users", force: true do |t|
    t.string   "username",               default: "",   null: false
    t.string   "name",                   default: ""
    t.string   "soname",                 default: ""
    t.string   "lastname",               default: ""
    t.date     "bday"
    t.text     "hobby",                  default: ""
    t.boolean  "enabled",                default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
