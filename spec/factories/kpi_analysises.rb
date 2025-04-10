FactoryBot.define do
  factory :kpi_analysis do
    association :survey_response
    data { { engagement_index: 4.2, category_averages: { "Leadership" => 4.5 } } }
  end
end
