require 'rails_helper'

RSpec.describe Paginator do

  let(:bruma) { create(:product) }
  let(:velaSandia) { create(:velaSandia) }
  let(:rollonMenta) { create(:rollonMenta) }

  let(:products) { [bruma, velaSandia, rollonMenta] }

  let(:scope) { Product.all }
  let(:params) { { 'page' => '1', 'per' => '2' } }
  let(:paginator) { Paginator.new(scope, params, 'url') }
  let(:paginated) { paginator.paginate }

  before do
    products
  end

  describe '#paginate' do
    it 'paginates the collection with 2 products' do
      expect(paginated.size).to eq 2
    end

    it 'contains bruma as the first paginated item' do
      expect(paginated.first).to eq bruma
    end

    it 'contains rollonMenta as the last paginated item' do
      expect(paginated.last).to eq velaSandia
    end
  end

  describe '#links' do
    let(:links) { paginator.links.split(', ') }

    context 'when first page' do
      let(:params) { { 'page' => '1', 'per' => '2' } }

      it 'builds the "next" relation link' do
        expect(links.first).to eq '<url?page=2&per=2>; rel="next"'
      end

      it 'builds the "last" relation link' do
        expect(links.last).to eq '<url?page=2&per=2>; rel="last"'
      end
    end

    context 'when last page' do
      let(:params) { { 'page' => '2', 'per' => '2' } }

      it 'builds the "first" relation link' do
        expect(links.first).to eq '<url?page=1&per=2>; rel="first"'
      end

      it 'builds the "previous" relation link' do
        expect(links.last).to eq '<url?page=1&per=2>; rel="prev"'
      end
    end
  end # drescribe '#links' end
end