require 'rails_helper'

RSpec.describe Sorter do
  let(:bruma) { create(:product) }
  let(:velaSandia) { create(:velaSandia) }
  let(:rollonMenta) { create(:rollonMenta) }
  let(:products) { [bruma, velaSandia, rollonMenta] }


  let(:scope) { Product.all }
  let(:params) { {} }
  let(:filter) { Filter.new(scope, params) }
  let(:filtered) { filter.filter }

  before do
    allow(ProductPresenter).to(
      receive(:filter_attributes).and_return(['id', 'name', 'created_at'])
    )
    products
  end

  describe '#filter' do
    context 'without any parameters' do
      it 'returns the scope unchanged' do
        expect(filtered).to eq scope
      end
    end

    context 'with valid parameters' do
      context 'with "name_eq=Bruma"' do
        let(:params) { { 'q' => { 'name_eq' => 'Bruma' } } }

        it 'gets only "Bruma" back' do
          expect(filtered.first.id).to eq bruma.id
          expect(filtered.size).to eq 1
        end
      end

      context 'with "name_cont=Menta"' do
        let(:params) { { 'q' => { 'name_cont' => 'Menta' } } }

        it 'gets only "Roll on Menta" back' do
          expect(filtered.first.id).to eq rollonMenta.id
          expect(filtered.size).to eq 1
        end
      end

      context 'with "name_notcont=Bruma"' do
        let(:params) { { 'q' => { 'name_notcont' => 'Bruma' } } }

        it 'gets only "Roll on Menta" back' do
          expect(filtered.size).to eq 2
        end
      end

      context 'with "name_start=Bruma"' do
        let(:params) { { 'q' => { 'name_start' => 'Bruma' } } }

        it 'gets only "Bruma" back' do
          expect(filtered.first.id).to eq bruma.id
          expect(filtered.size).to eq 1
        end
      end

      context 'with "name_end=Menta"' do
        let(:params) { { 'q' => { 'name_end' => 'Menta' } } }

        it 'gets only "Roll on Menta" back' do
          expect(filtered.first.id).to eq rollonMenta.id
        end
      end

      context 'with "created_at_lt=2023-02-10"' do
        let(:params) { { 'q' => { 'created_at_lt' => '2023-02-10' } } }

        it 'gets only the product created_at before 2023-02-10' do
          expect(filtered.size).to eq 3
        end
      end

      context 'with "created_at_gt=2023-02-10"' do
        let(:params) { { 'q' => { 'created_at_gt' => '2023-02-10' } } }

        it 'gets only the product created after 2023-02-10' do
          expect(filtered.size).to eq 0
        end
      end

    end

    context 'with invalid parameters' do
      context 'with invalid column name "fid"' do
        let(:params) { { 'q' => { 'fid_gt' => '2' } } }

        it 'raises a "QueryBuilderError" exception' do
          expect { filtered }.to raise_error(QueryBuilderError)
        end
      end

      context 'with invalid predicate "gtz"' do
        let(:params) { { 'q' => { 'id_gtz' => '2' } } }

        it 'raises a "QueryBuilderError" exception' do
          expect { filtered }.to raise_error(QueryBuilderError)
        end
      end
    end
  end # describe "filter" end
end