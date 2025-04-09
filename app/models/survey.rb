class Survey < ApplicationRecord
  has_many :categories
  has_many :survey_responses
end