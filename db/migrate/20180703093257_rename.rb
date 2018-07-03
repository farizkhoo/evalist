class Rename < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :age, :date_of_birth
  end
end
