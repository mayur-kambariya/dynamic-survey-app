class Category < ApplicationRecord
  belongs_to :survey
  has_many :questions, dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :survey_id }
end
