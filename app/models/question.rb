class Question < ApplicationRecord
  belongs_to :category
  has_many :answer_options, dependent: :destroy
  validates :text, presence: true, uniqueness: { scope: :category_id }
end
