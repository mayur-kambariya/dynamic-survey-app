require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:survey) { create(:survey) }
  subject { create(:category, survey: survey) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:survey_id) }
end
