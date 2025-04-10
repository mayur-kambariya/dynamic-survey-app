module Api::V1
  class SurveysController < ApplicationController
    def show
      @survey = Survey.includes(categories: { questions: :answer_options }).find_by(id: params[:id])
      head :not_found and return unless @survey
    end
  end
end
