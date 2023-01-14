require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:cost_price) }
    it { should validate_presence_of(:sale_price) }

    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end
  end
end
