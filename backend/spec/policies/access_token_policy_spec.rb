# frozen_string_literal: true

require 'rails_helper'

describe AccessTokenPolicy do
  subject { described_class }
  permissions :create? do
    it 'grants access' do
      expect(subject).to permit(nil, AccessToken.new)
    end
  end
  permissions :destroy? do
    it 'grants access if user is not admin' do
      expect(subject).to permit(nil, AccessToken.new)
    end
  end
end