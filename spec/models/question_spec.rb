require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:survey) { Survey.create!(title: 'Sample Survey') }
  let(:category) { Category.create!(name: 'Sample Category', survey: survey) }
  subject { Question.create!(text: 'Sample Question', category: category) }

  it { should validate_presence_of(:text) }
  it { should validate_uniqueness_of(:text).scoped_to(:category_id) }
end
