require 'rails_helper'

RSpec.describe Api::V1::KpiDashboardController, type: :controller do
  render_views

  describe "GET #index" do
    let(:user) { create(:user) }
    let(:survey) { create(:survey) }
    let(:category) { create(:category, survey: survey) }
    let(:question) { create(:question, category: category) }
    let(:answer_option) { create(:answer_option, question: question, score: 4) }
    let(:survey_response) { create(:survey_response, user: user, survey: survey) }

    before do
      create(:question_answer, survey_response: survey_response, question: question, answer_option: answer_option, score: 4, category_id: category.id)
    end

    it "returns success and valid JSON keys" do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json).to have_key("averages")
      expect(json).to have_key("engagement_index")
      expect(json).to have_key("high_performer_percent")
    end

    it "returns empty KPI data if there are no responses" do
      QuestionAnswer.delete_all
      get :index, format: :json
      json = JSON.parse(response.body)
      expect(json["engagement_index"]).to eq(0.0)
      expect(json["averages"]).to eq({})
      expect(json["high_performer_percent"]).to eq(0.0)
    end
  end
end
