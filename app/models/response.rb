class Response < ApplicationRecord
  belongs_to :project
  belongs_to :question, optional: true
  belongs_to :sender, foreign_key: :sender_id, class_name:'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name:'User'
end
