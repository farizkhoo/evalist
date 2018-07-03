class UsersEdit < ActiveRecord::Migration[5.2]
  def change
    drop_table :users
    create_table "users", force: :cascade do |t|
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "first_name"
      t.string "last_name"
      t.string "phone_number"
      t.string "job_title"
      t.string "email", null: false
      t.string "encrypted_password", limit: 128, null: false
      t.string "confirmation_token", limit: 128
      t.string "remember_token", limit: 128, null: false
      t.index ["email"], name: "index_users_on_email"
      t.index ["remember_token"], name: "index_users_on_remember_token"
    end
  end
end
