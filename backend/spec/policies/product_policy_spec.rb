
require 'rails_helper'

describe ProductPolicy do
  subject { described_class }
  permissions :index?, :show? do
    it 'grants access' do
      expect(subject).to permit(nil, Product.new)
    end
  end

  permissions :create?, :update?, :destroy? do
    it 'denies access if user is not admin' do
      expect(subject).not_to permit(build(:user), Product.new)
    end

    it 'grants access if user is admin' do
      expect(subject).to permit(build(:admin), Product.new)
    end
  end
end