# spec/requests/books_spec.rb
require 'rails_helper'

RSpec.describe 'Users', type: :request do
  include_context 'Skip Auth'

  let(:john) { create(:user) }
  let(:users) { [john] }

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
  end # describe GET /api/users end

  describe 'GET /api/users/:id' do
    it 'returns the user' do
      get "/api/users/#{john.id}"
      expect(json_body['data']['id']).to eq john.id
    end
  end

  describe 'POST /api/users' do
    let(:params) { { data: { email: 'example@gmail.com', password: 'password', name: 'John', role: 'user' } } }
    it 'creates a user' do
      expect { post '/api/users', params: params }.to change { User.count }.by(1)
    end
  end

  describe 'PATCH /api/users/:id' do
    let(:params) do
      { data: {
        email: 'johndoe@example.com'
      } }
    end

    it 'updates the user' do
      patch "/api/users/#{john.id}", params: params
      expect(json_body['data']['email']).to eq 'johndoe@example.com'
    end
  end

  describe 'DELETE /api/users/:id' do
    it 'removes the user' do
      delete "/api/users/#{john.id}"
      expect(response.status).to eq 204
      expect(User.count).to be 1
    end
  end
end
