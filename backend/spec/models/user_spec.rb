require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_presence_of(:password) }

    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it 'generates a confirmation token' do
      user.valid?
      expect(user.confirmation_token).to_not be nil
    end

    it 'downcases email before validating' do
      user.email = 'John@example.com'
      expect(user.valid?).to be true
      expect(user.email).to eq 'john@example.com'
    end
  end
end
