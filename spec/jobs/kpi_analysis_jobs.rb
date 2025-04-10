require 'rails_helper'

RSpec.describe KpiAnalysisJob, type: :job do
  describe "#perform" do
    let(:user) { create(:user) }
    let(:survey) { create(:survey) }
    let(:category) { create(:category, survey: survey) }
    let(:question) { create(:question, category: category) }
    let(:answer_option) { create(:answer_option, question: question, score: 4) }
    let(:survey_response) { create(:survey_response, user: user, survey: survey) }

    before do
      create(:question_answer, survey_response: survey_response, question: question, answer_option: answer_option, score: 4, category_id: category.id)
    end

    it "creates a KpiAnalysis record with correct data" do
      expect {
        described_class.new.perform(survey_response.id)
      }.to change { KpiAnalysis.count }.by(1)

      analysis = KpiAnalysis.last
      expect(analysis.data["engagement_index"]).to eq(4.0)
      expect(analysis.data["category_averages"][category.name]).to eq(4.0)
    end

    it "raises error if survey_response not found" do
      expect {
        described_class.new.perform(-1)
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
