class RankingQuestion < ApplicationRecord
  belongs_to :company
  belongs_to :project
  belongs_to :user
end
