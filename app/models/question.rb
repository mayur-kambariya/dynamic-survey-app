class Question < ApplicationRecord
  belongs_to :category
  has_many :answer_options
end