require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  include_context 'Skip Auth'

  let(:bienestar) { create(:category, :with_products, products_count: 1) }
  let(:facial) { create(:facial, :with_products, products_count: 1) }
  let(:capilar) { create(:capilar, :with_products, products_count: 1) }

  let(:categories) { [bienestar, facial, capilar] }

  describe 'GET /api/categories' do
    # Before any test, let's create products
    before { categories }

    context 'default behavior' do
      before { get '/api/categories' }

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
        before { get '/api/categories?fields=id,name' }

        it 'gets categories with only the id, name' do
          json_body['data'].each do |category|
            expect(category.keys).to eq ['id', 'name']
          end
        end
      end

      context 'without the "fields" parameter' do
        before { get '/api/categories' }

        it 'gets categories with all the fields specified in the presenter' do
          json_body['data'].each do |category|
            expect(category.keys).to eq CategoryPresenter.build_attributes.map(&:to_s)
          end
        end
      end

      context 'with invalid field name "fid"' do
        before { get '/api/categories?fields=fid,name' }

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
        before { get '/api/categories?embed=products' }

        it 'gets the category with his products embedded' do
          json_body['data'].each do |category|
            expect(category['products'][0].keys).to eq(
              [
                'id',
                'name',
                'description',
                'cost_price',
                'sale_price',
                'purchase_price',
                'active',
                'created_at',
                'updated_at',
                'image',
                'category_id'
              ])
          end
        end
      end

      context "with invalid 'embed' relation 'fake'" do
        before { get '/api/categories?embed=fake,products' }

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
        before { get('/api/categories?page=1&per=2') }

        it 'receives HTTP status 200' do
          expect(response.status).to eq 200
        end

        it 'receives only two categories' do
          expect(json_body['data'].size).to eq 2
        end

        it 'receives a response with the Link header' do
          expect(response.headers['Link'].split(', ').first).to eq(
            '<http://www.example.com/api/categories?page=2&per=2>; rel="next"'
          )
        end
      end

      context 'when asking for the second page' do
        before { get('/api/categories?page=2&per=2') }

        it 'receives HTTP status 200' do
          expect(response.status).to eq 200
        end

        it 'receives only one product' do
          expect(json_body['data'].size).to eq 1
        end
      end


      context "when sending invalid 'page' and 'per' parameters" do
        before { get('/api/categories?page=fake&per=10') }

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
        it 'sorts the categories by "id desc"' do
          get('/api/categories?sort=id&dir=desc')
          expect(json_body['data'].first['id']).to eq capilar.id
          expect(json_body['data'].last['id']).to eq bienestar.id
        end
      end

      context 'with invalid column name "fid"' do
        before { get '/api/categories?sort=fid&dir=asc' }
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
      context 'with valid filtering param "q[name_cont]=Bienestar"' do
        it 'receives "bienestar" back' do
          get('/api/categories?q[name_cont]=Bienestar')
          expect(json_body['data'].first['id']).to eq bienestar.id
          expect(json_body['data'].size).to eq 1
        end
      end

      context 'with invalid param "q[fname_cont]=bienestar"' do
        before { get '/api/categories?q[fname_cont]=bienestar' }

        it 'gets "400 Bad Requests" back' do
          expect(response.status).to eq 400
        end

        it 'receives an error' do
          expect(json_body['error']).to_not be nil
        end

        it 'receives "q[fname_cont]=bienestar" as an invalid param' do
          expect(json_body['error']['invalid_params']).to eq 'q[fname_cont]=bienestar'
        end
      end
    end # describe 'filtering' end

  end

  describe 'GET /api/categories/:id' do

    context 'with existing resource' do
      before { get "/api/categories/#{bienestar.id}" }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives the "bienestar" product as JSON' do
        expected = { data: CategoryPresenter.new(bienestar, {}).fields.embeds }
        expect(response.body).to eq(expected.to_json)
      end
    end

    context 'with nonexistent resource' do
      it 'gets HTTP status 404' do
        get "/api/categories/231457"
        expect(response.status).to eq 404
      end
    end
  end # describe 'GET /api/products/:id'

  describe 'POST /api/catetories' do
    before { post '/api/categories', params: { data: params } }

    context 'with valid parameters' do
      let(:params) do
        attributes_for(:category, name: bienestar.name)
      end

      it 'gets HTTP status 201' do
        expect(response.status).to eq 201
      end

      it 'receives the newly created resource' do
        expect(json_body['data']['name']).to eq 'Bienestar'
      end

      it 'adds a record in the database' do
        expect(Category.count).to eq 2
      end

      it 'gets the new resource location in the Location header' do
        expect(response.headers['Location']).to eq(
          "http://www.example.com/api/categories/#{Category.second.id}"
        )
      end
    end

    context 'with invalid parameters' do
      let(:params) { attributes_for(:category, name: '') }

      it 'gets HTTP status 422' do
        expect(response.status).to eq 422
      end

      it 'receives the error details' do
        expect(json_body['error']['invalid_params']).to eq(
          { 'name'=>["can't be blank"] }
        )
      end

      it 'does not add a record in the database' do
        expect(Category.count).to eq 0
      end
    end
  end # describe 'POST /api/products'

  describe 'PATCH /api/categories/:id' do
    before { patch "/api/categories/#{bienestar.id}", params: { data: params } }

    context 'with valid parameters' do
      let(:params) { { name: 'Bienestar' } }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives the updated resource' do
        expect(json_body['data']['name']).to eq 'Bienestar'
      end

      it 'updates the record in the database' do
        expect(Category.first.name).to eq 'Bienestar'
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
        expect(Category.first.name).to eq 'Bienestar'
      end
    end
  end # describe 'PATCH /api/products'


  describe 'DELETE /api/categories/:id' do
    context 'with existing resource' do
      before { delete "/api/categories/#{bienestar.id}" }

      it 'gets HTTP status 204' do
        expect(response.status).to eq 204
      end

      it 'deletes the product from the database' do
        expect(Category.count).to eq 0
      end
    end

    context 'with nonexistent resource' do
      it 'gets HTTP status 404' do
        delete '/api/categories/2314323'
        expect(response.status).to eq 404
      end
    end
  end
end
