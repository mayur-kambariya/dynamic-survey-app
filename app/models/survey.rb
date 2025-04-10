class Survey < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :survey_responses, dependent: :destroy
  validates :title, presence: true, uniqueness: true
end