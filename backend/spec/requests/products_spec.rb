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

      context 'with invalid field name "fid"' do
        before { get '/api/products?fields=fid,name,category_id' }

        it 'gets "400 Bad Request" back' do
          expect(response.status).to eq 400
        end

        it 'recieves an error' do
          expect(json_body['error']).to_not be nil
        end

        it 'recieves "fields=fid" as an invalid param' do
          expect(json_body['error']['invalid_params']).to eq 'fields=fid'
        end
      end
    end # end of describe 'field picking'

    describe 'embed picking' do
      context "with the 'embed' parameter" do
        before { get '/api/products?embed=category' }

        it 'gets the products with his category embedded' do
          json_body['data'].each do |product|
            expect(product['category'].keys).to eq(
              ['id', 'name', 'description', 'created_at', 'updated_at']
            )
          end
        end
      end

      context "with invalid 'embed' relation 'fake'" do
        before { get '/api/products?embed=fake,category' }

        it 'gets "400 Bad Request" back' do
          expect(response.status).to eq 400
        end

        it 'receives an error' do
          expect(json_body['error']).to_not be nil
        end

        it 'receives "fields=fid" as an invalid param' do
          expect(json_body['error']['invalid_params']).to eq 'embed=fake'
        end
      end
    end

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

    describe 'sorting' do
      context 'with valid column name "id"' do
        it 'sorts the books by "id desc"' do
          get('/api/products?sort=id&dir=desc')
          expect(json_body['data'].first['id']).to eq rollonMenta.id
          expect(json_body['data'].last['id']).to eq bruma.id
        end
      end

      context 'with invalid column name "fid"' do
        before { get '/api/products?sort=fid&dir=asc' }
        it 'gets "400 Bad Requests" back' do
          expect(response.status).to eq 400
        end

        it 'receives an error' do
          expect(json_body['error']).to_not be nil
        end

        it 'receives "sort=fid" as an invalid param' do
          expect(json_body['error']['invalid_params']).to eq 'sort=fid'
        end
      end
    end # describe 'sorting' end

    describe 'filtering' do
      context 'with valid filtering param "q[name_cont]=Bruma"' do
        it 'receives "Bruma" back' do
          get('/api/products?q[name_cont]=Bruma')
          expect(json_body['data'].first['id']).to eq bruma.id
          expect(json_body['data'].size).to eq 1
        end
      end

      context 'with invalid param "q[fname_cont]=Bruma"' do
        before { get '/api/products?q[fname_cont]=Bruma' }

        it 'gets "400 Bad Requests" back' do
          expect(response.status).to eq 400
        end

        it 'receives an error' do
          expect(json_body['error']).to_not be nil
        end

        it 'receives "q[fname_cont]=Bruma" as an invalid param' do
          expect(json_body['error']['invalid_params']).to eq 'q[fname_cont]=Bruma'
        end
      end
    end # describe 'filtering' end

  end

  describe 'GET /api/producst/:id' do

    context 'with existing resource' do
      before { get "/api/products/#{bruma.id}" }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives the "Bruma" product as JSON' do
        expected = { data: ProductPresenter.new(bruma, {}).fields.embeds }
        expect(response.body).to eq(expected.to_json)
      end
    end

    context 'with nonexistent resource' do
      it 'gets HTTP status 404' do
        get "/api/products/231457"
        expect(response.status).to eq 404
      end
    end
  end # describe 'GET /api/products/:id'

  describe 'POST /api/products' do
    let(:bienestar) { create(:category) }
    before { post '/api/products', params: { data: params } }

    context 'with valid parameters' do
      let(:params) do
        attributes_for(:product, category_id: bienestar.id)
      end

      it 'gets HTTP status 201' do
        expect(response.status).to eq 201
      end

      it 'receives the newly created resource' do
        expect(json_body['data']['name']).to eq 'Bruma'
      end

      it 'adds a record in the database' do
        expect(Product.count).to eq 1
      end

      it 'gets the new resource location in the Location header' do
        expect(response.headers['Location']).to eq(
          "http://www.example.com/api/products/#{Product.first.id}"
        )
      end
    end

    context 'with invalid parameters' do
      let(:params) { attributes_for(:product, name: '') }

      it 'gets HTTP status 422' do
        expect(response.status).to eq 422
      end

      it 'receives the error details' do
        expect(json_body['error']['invalid_params']).to eq(
          { 'category'=>['must exist'], 'name'=>["can't be blank"] }
        )
      end

      it 'does not add a record in the database' do
        expect(Product.count).to eq 0
      end
    end
  end # describe 'POST /api/products'

  describe 'PATCH /api/products/:id' do
    before { patch "/api/products/#{bruma.id}", params: { data: params } }

    context 'with valid parameters' do
      let(:params) { { name: 'Bruma de Almohada' } }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives the updated resource' do
        expect(json_body['data']['name']).to eq 'Bruma de Almohada'
      end

      it 'updates the record in the database' do
        expect(Product.first.name).to eq 'Bruma de Almohada'
      end
    end

    context 'with invalid parameters' do
      let(:params) { { name: '' } }

      it 'gets HTTP status 422' do
        expect(response.status).to eq 422
      end

      it 'receives the error details' do
        expect(json_body['error']['invalid_params']).to eq(
          { 'name'=>["can't be blank"] }
        )
      end

      it 'does not add a record in the database' do
        expect(Product.first.name).to eq 'Bruma'
      end
    end
  end # describe 'PATCH /api/products'


  describe 'DELETE /api/products/:id' do
    context 'with existing resource' do
      before { delete "/api/products/#{bruma.id}" }

      it 'gets HTTP status 204' do
        expect(response.status).to eq 204
      end

      it 'deletes the product from the database' do
        expect(Product.count).to eq 0
      end
    end

    context 'with nonexistent resource' do
      it 'gets HTTP status 404' do
        delete '/api/products/2314323'
        expect(response.status).to eq 404
      end
    end
  end
end
