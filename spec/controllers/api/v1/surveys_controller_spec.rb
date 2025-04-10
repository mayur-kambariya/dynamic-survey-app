require 'rails_helper'

RSpec.describe Api::V1::SurveysController, type: :controller do
  render_views
  describe 'GET #show' do
    let(:survey) { create(:survey) }
    let(:category) { create(:category, survey: survey) }
    let(:question) { create(:question, category: category) }
    let(:answer_option) { create(:answer_option, question: question) }

    before do
      survey.categories << category
      category.questions << question
      question.answer_options << answer_option
    end

    context 'with valid survey ID' do
      it 'returns the survey with categories, questions, and answer options' do
        get :show, params: { id: survey.id }, format: :json
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['id']).to eq(survey.id)
        expect(json_response['categories'].first['id']).to eq(category.id)
        expect(json_response['categories'].first['questions'].first['id']).to eq(question.id)
        expect(json_response['categories'].first['questions'].first['options'].first['id']).to eq(answer_option.id)
      end
    end

    context 'with invalid survey ID' do
      it 'returns a not found error' do
        get :show, params: { id: 'invalid' }, format: :json
        expect(response).to have_http_status(:not_found)
      end
    end

    context 'when survey has no categories' do
      it 'returns an empty categories array' do
        survey.categories.destroy_all
        get :show, params: { id: survey.id }, format: :json
        json_response = JSON.parse(response.body)
        expect(json_response['categories']).to be_empty
      end
    end

    context 'when category has no questions' do
      it 'returns an empty questions array' do
        category.questions.destroy_all
        get :show, params: { id: survey.id }, format: :json
        json_response = JSON.parse(response.body)
        expect(json_response['categories'].first['questions']).to be_empty
      end
    end

    context 'when question has no answer options' do
      it 'returns an empty options array' do
        question.answer_options.destroy_all
        get :show, params: { id: survey.id }, format: :json
        json_response = JSON.parse(response.body)
        expect(json_response['categories'].first['questions'].first['options']).to be_empty
      end
    end
  end
end