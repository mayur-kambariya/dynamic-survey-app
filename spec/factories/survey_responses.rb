FactoryBot.define do
  factory :survey_response do
    association :user
    association :survey
  end
end
