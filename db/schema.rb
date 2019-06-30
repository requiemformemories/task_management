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
    t.string "catid"
    t.string "catname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_taskships", force: :cascade do |t|
    t.string "ttid"
    t.string "tag"
    t.string "task"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "tagid"
    t.string "tagname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "taskid"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "topic"
    t.text "content"
    t.integer "priority"
    t.integer "status"
    t.string "cat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_taskships", force: :cascade do |t|
    t.string "utid"
    t.string "user"
    t.string "task"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "username"
    t.string "passwd"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
