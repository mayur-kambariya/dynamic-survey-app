module Api::V1
  class SurveyResponsesController < ApplicationController
    skip_before_action :verify_authenticity_token # Skip CSRF token verification for API requests
    def create
      ActiveRecord::Base.transaction do
        response = SurveyResponse.create!(user_id: params[:user_id], survey_id: params[:survey_id])

        question_answers = params[:question_answer_object].map do |qa|
          {
            survey_response_id: response.id,
            question_id: qa[:question_id],
            answer_option_id: qa[:answer_id],
            score: qa[:score],
            category_id: qa[:category_id]
          }
        end
        QuestionAnswer.insert_all!(question_answers)
        KpiAnalysisJob.perform_later(response.id)
        render json: { success: true }, status: :created
      end
    rescue => e
      render json: { success: false, error: e.message }, status: :unprocessable_entity
    end
  end
end