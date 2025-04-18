require 'rails_helper'

RSpec.describe SurveyResponse, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:survey) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:survey_id) }
end
