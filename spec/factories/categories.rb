FactoryBot.define do
  factory :category do
    name { "Work Culture" }
    association :survey
  end
end