# frozen_string_literal: true

class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :user_id, :integer
    add_column :questions, :tags_all, :array, default: []
    add_column :questions, :tags_top_pick, :array, default: []
    add_column :questions, :questionnaire, :text
    add_column :questions, :answers,
  end
end
