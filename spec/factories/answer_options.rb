FactoryBot.define do
  factory :answer_option do
    text { Faker::Lorem.sentence(word_count: 3) }
    score { Faker::Number.between(from: 1, to: 5) }
    association :question
  end
end