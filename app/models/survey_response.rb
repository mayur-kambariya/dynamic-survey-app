class SurveyResponse < ApplicationRecord
  belongs_to :user
  belongs_to :survey
  has_many :question_answers, dependent: :destroy

  validates :user_id, :survey_id, presence: true
end
