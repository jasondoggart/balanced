require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { should validate_presence_of(:name) }
  it { should belong_to(:category) }
end
