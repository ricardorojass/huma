require 'rails_helper'

RSpec.describe 'CartItems', type: :request do
  include_context 'Skip Auth'

  let(:cart1) { create(:cart1) }
  let(:cart2) { create(:cart2) }
  let(:bruma) { create(:product) }

  let(:cart_items) { [cart1, cart2] }

  describe 'GET /api/cart_items' do
    before { cart_items }

    context 'default behavior' do
      before { get '/api/cart_items' }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives a json with the "data"' do
        expect(json_body['data']).to_not be nil
      end

      it 'receives 2 items in the data' do
        expect(json_body['data'].size).to eq 2
      end
    end # end of describe 'default behavior'

    describe 'embed picking' do
      context "with the 'embed' parameter" do
        before { get '/api/cart_items?embed=product' }

        it 'gets the category with his products embedded' do
          json_body['data'].each do |cart_item|
            expect(cart_item['product'].keys).to eq(
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
        before { get '/api/cart_items?embed=fake,product' }

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

  end

  describe 'GET /api/cart_items/:id' do

    context 'with existing resource' do
      before { get "/api/cart_items/#{cart1.id}" }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives the cart1 as JSON' do
        expected = { data: CartItemPresenter.new(cart1, {}).fields.embeds }
        expect(response.body).to eq(expected.to_json)
      end
    end

    context 'with nonexistent resource' do
      it 'gets HTTP status 404' do
        get "/api/cart_items/231457"
        expect(response.status).to eq 404
      end
    end
  end # describe 'GET /api/cart_items/:id'

  describe 'POST /api/cart_items' do
    before { post '/api/cart_items', params: { data: params } }

    context 'with valid parameters' do
      let(:params) do
        attributes_for(:cart1, product_id: bruma.id)
      end

      it 'gets HTTP status 201' do
        expect(response.status).to eq 201
      end

      it 'receives the newly created resource' do
        expect(json_body['data']['product_id']).to eq bruma.id
      end

      it 'adds a record in the database' do
        expect(CartItem.count).to eq 1
      end

      it 'gets the new resource location in the Location header' do
        expect(response.headers['Location']).to eq(
          "http://www.example.com/api/cart_items/#{CartItem.first.id}"
        )
      end
    end

    context 'with invalid parameters' do
      let(:params) { attributes_for(:cart1, product_id: nil) }

      it 'gets HTTP status 422' do
        expect(response.status).to eq 422
      end

      it 'receives the error details' do
        expect(json_body['error']['invalid_params']).to eq(
          { 'product'=>["must exist"] }
        )
      end

      it 'does not add a record in the database' do
        expect(CartItem.count).to eq 0
      end
    end
  end # describe 'POST /api/cart_items'

  describe 'PATCH /api/cart_items/:id' do
    before { patch "/api/cart_items/#{cart1.id}", params: { data: params } }

    context 'with valid parameters' do
      let(:params) { { quantity: 2 } }

      it 'gets HTTP status 200' do
        expect(response.status).to eq 200
      end

      it 'receives the updated resource' do
        expect(json_body['data']['quantity']).to eq 2
      end

      it 'updates the record in the database' do
        expect(CartItem.first.quantity).to eq 2
      end
    end

    context 'with invalid parameters' do
      let(:params) { { product_id: nil } }

      it 'gets HTTP status 422' do
        expect(response.status).to eq 422
      end

      it 'receives the error details' do
        expect(json_body['error']['invalid_params']).to eq(
          { 'product'=>["must exist"] }
        )
      end

      it 'does not add a record in the database' do
        expect(CartItem.first.quantity).to eq 1
      end
    end
  end # describe 'PATCH /api/products'


  describe 'DELETE /api/cart_items/:id' do
    context 'with existing resource' do
      before { delete "/api/cart_items/#{cart1.id}" }

      it 'gets HTTP status 204' do
        expect(response.status).to eq 204
      end

      it 'deletes the product from the database' do
        expect(CartItem.count).to eq 0
      end
    end

    context 'with nonexistent resource' do
      it 'gets HTTP status 404' do
        delete '/api/cart_items/2314323'
        expect(response.status).to eq 404
      end
    end
  end
end
