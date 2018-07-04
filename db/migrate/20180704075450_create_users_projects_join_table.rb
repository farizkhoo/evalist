class CreateUsersProjectsJoinTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :project_users, id: false do |t|
  		t.integer :user_id
  		t.integer :project_id
  	end

  add_index :project_users, :user_id
  add_index :project_users, :project_id
  end
end
