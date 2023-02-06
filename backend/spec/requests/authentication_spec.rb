require 'rails_helper'

RSpec.describe 'Authentication', type: :request do
  describe 'Client Authentication' do
    before { get '/api/books', headers: headers }

    context 'with invalid authentication scheme' do
      let(:headers) { { 'HTTP_AUTHORIZATION' => '' } }

      it 'gets HTTP status 401 Unauthorized' do
        expect(response.status).to eq 401
      end
    end

  end
end