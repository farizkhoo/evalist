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

ActiveRecord::Schema.define(version: 2018_07_03_102735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_projects_on_company_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.integer "project_id"
    t.text "question"
  end

  create_table "ranking_questions", force: :cascade do |t|
    t.string "question"
    t.string "text"
    t.bigint "company_id"
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_ranking_questions_on_company_id"
    t.index ["project_id"], name: "index_ranking_questions_on_project_id"
    t.index ["user_id"], name: "index_ranking_questions_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.text "persona_tags"
    t.text "descriptive_tags"
    t.bigint "company_id"
    t.bigint "project_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tags_on_company_id"
    t.index ["project_id"], name: "index_tags_on_project_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "projects", "companies"
  add_foreign_key "projects", "users"
  add_foreign_key "ranking_questions", "companies"
  add_foreign_key "ranking_questions", "projects"
  add_foreign_key "ranking_questions", "users"
  add_foreign_key "tags", "companies"
  add_foreign_key "tags", "projects"
  add_foreign_key "tags", "users"
end
