# spec/requests/books_spec.rb
require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:bruma) { create(:bruma) }
  let(:rollonMenta) { create(:rollonMenta) }

  # Putting them in an array make it easier to create them in one line
  let(:products) { [bruma, rollonMenta] }

  describe 'GET /api/products' do
    # Before any test, let's create products
    before { products }

    context 'default behavior' do
      before { get '/api/products' }

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

    describe 'field picking' do
      context 'with the fields parameter' do
        before { get '/api/products?fields=id,name,description,category_id' }

        it 'gets products with only the id, name, description and category_id keys' do
          json_body['data'].each do |product|
            expect(product.keys).to eq ['id', 'name', 'description', 'category_id']
          end
        end
      end

      context 'without the "fields" parameter' do
        before { get '/api/products' }

        it 'gets products with all the fields specified in the presenter' do
          json_body['data'].each do |product|
            expect(product.keys).to eq ProductPresenter.build_attributes.map(&:to_s)
          end
        end
      end
    end # end of describe 'field picking'
  end
end
