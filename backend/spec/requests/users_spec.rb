# spec/requests/books_spec.rb
require 'rails_helper'

RSpec.describe 'Users', type: :request do

  let(:richi) { create(:richi )}
  let(:vane) { create(:vane )}

  # Putting them in an array make it easier to create them in one line
  let(:users) { [richi, vane] }

  describe 'GET /api/users' do
    # Before any test, let's create our 2 users
    before { users }

    context 'default behavior' do
      before { get '/api/users' }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives a json with the "data" root key' do
        expect(json_body['data']).to_not be nil
      end

      it 'receives all 2 users' do
        expect(json_body['data'].size).to eq 2
      end

    end
  end
end