# spec/requests/books_spec.rb
require 'rails_helper'

RSpec.describe 'Products', type: :request do

  let(:bruma) { create(:bruma )}
  let(:rollonMenta) { create(:rollonMenta )}

  # Putting them in an array make it easier to create them in one line
  let(:products) { [bruma, rollonMenta] }

  describe 'GET /api/books' do
    # Before any test, let's create our 2 users
    before { products }

    context 'default behavior' do
      before { get '/api/books' }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives a json with the "data" root key' do
        expect(json_body['data']).to_not be nil
      end

      it 'receives all 2 products' do
        expect(json_body['data'].size).to eq 2
      end

    end
  end
end