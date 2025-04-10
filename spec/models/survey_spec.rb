require 'rails_helper'

RSpec.describe Survey, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
end