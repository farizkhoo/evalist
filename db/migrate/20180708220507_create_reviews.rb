class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
    	t.integer :project_id
    	t.integer :sender_id
    	t.integer :recipient_id
    	t.boolean :reviewed, default: false
    	t.timestamps
    end
  end
end
