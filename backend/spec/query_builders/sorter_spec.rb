require 'rails_helper'

RSpec.describe Sorter do
  let(:bruma) { create(:product) }
  let(:velaSandia) { create(:velaSandia) }
  let(:rollonMenta) { create(:rollonMenta) }
  let(:products) { [bruma, velaSandia, rollonMenta] }


  let(:scope) { Product.all }
  let(:params) { HashWithIndifferentAccess.new({ sort: 'id', dir: 'desc' }) }
  let(:sorter) { Sorter.new(scope, params) }
  let(:sorted) { sorter.sort }

  before do
    allow(ProductPresenter).to(
      receive(:sort_attributes).and_return(['id', 'title'])
    )
    products
  end

  describe '#sort' do
    context 'without any parameters' do
      let(:params) { {} }
      it 'returns the scope unchanged' do
        expect(sorted).to eq scope
      end
    end

    context 'with valid parameters' do
      it 'sorts the collection by "id desc"' do
        expect(sorted.first.id).to eq rollonMenta.id
        expect(sorted.last.id).to eq bruma.id
      end

      it 'sorts the collection by "name asc"' do
        expect(sorted.first.id).to eq rollonMenta.id
        expect(sorted.last.id).to eq bruma.id
      end
    end

    context 'with invalid parameters' do
      let(:params) { HashWithIndifferentAccess.new({ sort: 'fid', dir: 'desc' }) }
      it 'raises a QueryBuilderError exception' do
        expect { sorted }.to raise_error(QueryBuilderError)
      end
    end
  end # describe "sort" end
end