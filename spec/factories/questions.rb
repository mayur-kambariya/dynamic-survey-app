FactoryBot.define do
  factory :question do
    text { "How do you feel about your work environment?" }
    association :category
  end
end