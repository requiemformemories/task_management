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

ActiveRecord::Schema.define(version: 2019_06_30_152000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "catname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catname"], name: "index_categories_on_catname", unique: true
  end

  create_table "tag_taskships", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tagname", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tagname"], name: "index_tags_on_tagname", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "taskid", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "topic", null: false
    t.text "content"
    t.integer "priority", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["taskid"], name: "index_tasks_on_taskid", unique: true
  end

  create_table "user_taskships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "name", null: false
    t.string "username", null: false
    t.string "passwd", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

end
