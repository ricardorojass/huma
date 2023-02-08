# spec/requests/books_spec.rb
require 'rails_helper'

RSpec.describe 'Products', type: :request do
  let(:bruma) { create(:product) }
  let(:velaSandia) { create(:velaSandia) }
  let(:rollonMenta) { create(:rollonMenta) }

  # Putting them in an array make it easier to create them in one line
  let(:products) { [bruma, velaSandia, rollonMenta] }

  describe 'GET /api/products' do
    # Before any test, let's create products
    before { products }

    context 'default behavior' do
      before { get '/api/products' }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives a json with the "data"' do
        expect(json_body['data']).to_not be nil
      end

      it 'receives 3 items in the data' do
        expect(json_body['data'].size).to eq 3
      end
    end # end of describe 'default behavior'

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

    describe 'pagination' do
      context 'when asking for the first_page' do
        before { get('/api/products?page=1&per=2') }

        it 'receives HTTP status 200' do
          expect(response.status).to eq 200
        end

        it 'receives only two products' do
          expect(json_body['data'].size).to eq 2
        end

        it 'receives a response with the Link header' do
          expect(response.headers['Link'].split(', ').first).to eq(
            '<http://www.example.com/api/products?page=2&per=2>; rel="next"'
          )
        end
      end

      context 'when asking for the second page' do
        before { get('/api/products?page=2&per=2') }

        it 'receives HTTP status 200' do
          expect(response.status).to eq 200
        end

        it 'receives only one product' do
          expect(json_body['data'].size).to eq 1
        end
      end


      context "when sending invalid 'page' and 'per' parameters" do
        before { get('/api/products?page=fake&per=10') }

        it 'receives HTTP status 400' do
          expect(response.status).to eq 400
        end

        it 'receives an error' do
          expect(json_body['error']).to_not be nil
        end

        it "receives 'page=fake' as an invalid param" do
          expect(json_body['error']['invalid_params']).to eq 'page=fake'
        end
      end
    end # describe 'pagination' end

  end
end
