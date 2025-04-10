class KpiAnalysisJob < ApplicationJob
  queue_as :default

  def perform(survey_response_id)
    response = SurveyResponse.find(survey_response_id)

    scores = response.question_answers
    avg_by_cat = scores.group_by(&:category_id).transform_values do |qa|
      qa.map(&:score).sum.to_f / qa.size
    end

    engagement = scores.map(&:score).sum.to_f / scores.size

    KpiAnalysis.create!(
      survey_response: response,
      data: {
        engagement_index: engagement.round(2),
        category_averages: avg_by_cat.transform_keys { |id| Category.find(id).name }
      }
    )
  end
end
