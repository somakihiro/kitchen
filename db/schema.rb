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

ActiveRecord::Schema.define(version: 20160426091713) do

  create_table "recipe_materials", force: :cascade do |t|
    t.string   "material"
    t.string   "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "recipe_id"
  end

  add_index "recipe_materials", ["recipe_id"], name: "index_recipe_materials_on_recipe_id"

  create_table "recipe_points", force: :cascade do |t|
    t.string   "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "recipe_id"
  end

  add_index "recipe_points", ["recipe_id"], name: "index_recipe_points_on_recipe_id"

  create_table "recipe_steps", force: :cascade do |t|
    t.text     "step"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recipe_steps", ["recipe_id"], name: "index_recipe_steps_on_recipe_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.integer  "user_id"
  end

  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "introduction"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
