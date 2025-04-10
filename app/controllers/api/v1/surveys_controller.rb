module Api::V1
  class SurveysController < ApplicationController
    def show
      @survey = Survey.includes(categories: { questions: :answer_options }).find_by(id: params[:id])

      return render json: { error: 'Survey not found' }, status: :not_found unless @survey
    end
  end
end