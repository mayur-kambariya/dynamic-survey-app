require 'rails_helper'

RSpec.describe Api::V1::SurveyResponsesController, type: :controller do
  describe 'POST #create' do
    let(:user) { create(:user) }
    let(:survey) { create(:survey) }
    let(:category) { create(:category, survey: survey) }
    let(:question) { create(:question, category: category) }
    let(:answer_option) { create(:answer_option, question: question) }

    it 'creates survey response and question answers' do
      post :create, params: {
        user_id: user.id,
        survey_id: survey.id,
        question_answer_object: [
          {
            question_id: question.id,
            answer_id: answer_option.id,
            score: 3,
            category_id: category.id
          }
        ]
      }

      expect(response).to have_http_status(:created)
      expect(SurveyResponse.count).to eq(1)
      expect(QuestionAnswer.count).to eq(1)
    end

    it 'returns error if data is invalid' do
      post :create, params: { user_id: nil, survey_id: nil, question_answer_object: [] }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end