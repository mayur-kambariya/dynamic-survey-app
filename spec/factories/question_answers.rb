FactoryBot.define do
  factory :question_answer do
    association :survey_response
    association :question
    association :answer_option
    score { answer_option.score }
    category_id { question.category_id }
  end
end