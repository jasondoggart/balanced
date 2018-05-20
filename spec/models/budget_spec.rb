require 'rails_helper'

RSpec.describe Budget, type: :model do
  it { should validate_presence_of(:name) }
  it { should have_many(:categories).dependent(:destroy) }
end
