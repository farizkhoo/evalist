class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
    	t.integer :sender_id
    	t.integer :recipient_id
      t.integer :value
      t.references :project, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
