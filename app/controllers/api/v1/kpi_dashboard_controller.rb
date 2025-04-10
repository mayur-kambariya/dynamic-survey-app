module Api::V1
  class KpiDashboardController < ApplicationController
    def index
      categories = Category.all.includes(:questions)
      @averages = {}

      categories.each do |category|
        responses = QuestionAnswer.where(category_id: category.id)
        avg = responses.average(:score)&.round(2) || 0
        if responses.present?
          @averages[category.name] = avg
        end
      end

      all_scores = QuestionAnswer.pluck(:score)
      @engagement_index = all_scores.present? ? (all_scores.sum.to_f / all_scores.size).round(2) : 0.0

      user_ids = SurveyResponse.pluck(:user_id).uniq
      high_performers = user_ids.count do |uid|
        user_avg = QuestionAnswer.joins(:survey_response)
                                 .where(survey_responses: { user_id: uid })
                                 .average(:score).to_f
        user_avg >= 4
      end

      @high_percent = ((high_performers.to_f / user_ids.size) * 100).round(2) || 0.0
    end
  end
end