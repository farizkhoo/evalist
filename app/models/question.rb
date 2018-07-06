class Question < ApplicationRecord
	enum category: %i[commercial aptitude teamwork innovation leadership]
	has_many :responses
end
