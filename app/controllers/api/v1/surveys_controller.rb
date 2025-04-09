module Api::V1
  class SurveysController < ApplicationController
    def show
      survey = Survey.includes(categories: { questions: :answer_options }).find(params[:id])

      render json: {
        id: survey.id,
        title: survey.title,
        categories: survey.categories.map do |cat|
          {
            id: cat.id,
            name: cat.name,
            questions: cat.questions.map do |q|
              {
                id: q.id,
                text: q.text,
                category_id: cat.id,
                options: q.answer_options.map do |opt|
                  { id: opt.id, text: opt.text, score: opt.score }
                end
              }
            end
          }
        end
      }
    end
  end
end