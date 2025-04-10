class QuestionAnswer < ApplicationRecord
  belongs_to :survey_response
  belongs_to :question
  belongs_to :answer_option
  belongs_to :category
end
