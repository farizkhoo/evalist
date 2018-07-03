
class CreateRankingQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :ranking_questions do |t|
      t.string :question
      t.string :text
      t.references :company, foreign_key: true
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
