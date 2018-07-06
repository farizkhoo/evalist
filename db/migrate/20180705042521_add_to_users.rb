class AddToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :job_title, :string
    add_column :users, :birthdate, :string
    add_column :users, :about, :text, limit: 1000
  end
end
