class Question < ApplicationRecord
	enum role: %i[commercial aptitude teamwork innovation leadership]
end
