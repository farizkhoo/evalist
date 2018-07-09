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

<<<<<<< Updated upstream
ActiveRecord::Schema.define(version: 2018_07_06_094409) do
=======
ActiveRecord::Schema.define(version: 2018_07_08_220507) do
>>>>>>> Stashed changes

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string "uid"
    t.string "token"
    t.string "provider"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "completed"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner_id"
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.index ["project_id"], name: "index_projects_users_on_project_id"
    t.index ["user_id"], name: "index_projects_users_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "category"
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.integer "value"
    t.bigint "project_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_responses_on_project_id"
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "name"
    t.string "phone"
    t.string "password"
    t.integer "role", default: 0
    t.string "job_title"
    t.date "birthdate"
    t.text "about"
    t.string "gender"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
  add_foreign_key "responses", "projects"
  add_foreign_key "responses", "questions"
end
