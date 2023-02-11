# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EmbedPicker' do
  let(:category) { create(:category) }
  let(:bruma) { create(:product, category_id: category.id) }
  let(:rollonMenta) { create(:rollonMenta, category_id: category.id) }

  let(:params) { {} }
  let(:embed_picker) { EmbedPicker.new(presenter) }

  describe '#embed' do
    context 'with category (belongs-to) as the resource' do
      let(:presenter) { ProductPresenter.new(bruma, params) }

      before do
        allow(ProductPresenter).to(
          receive(:relations).and_return(['category'])
        )
      end

      context 'with no "embed" parameter' do
        it 'returns the "data" hash without changing it' do
          expect(embed_picker.embed.data).to eq presenter.data
        end
      end

      context 'with invalid relation "something"' do
        let(:params) { { embed: 'something' } }

        it 'raises a "RepresentationBuilderError"' do
          expect { embed_picker.embed }.to raise_error(RepresentationBuilderError)
        end
      end

      context 'with the "embed" parameter containing "category"' do
        let(:params) { { embed: 'category' } }

        it 'embeds the "category" data' do
          expect(embed_picker.embed.data[:category]).to eq({
            'id' => category.id,
            'name' => category.name,
            'created_at' => category.created_at,
            'updated_at' => category.updated_at,
          })
        end
      end

      context 'with the "embed" parameter "products"' do
        let(:params) { { embed: 'products' } }
        let(:presenter) { CategoryPresenter.new(category, params) }

        before do
          bruma && rollonMenta
          allow(CategoryPresenter).to(
            receive(:relations).and_return(['products'])
          )
        end

        it 'embeds the "products" data' do
          expect(embed_picker.embed.data[:products].size).to eq(2)
          expect(embed_picker.embed.data[:products].first['id']).to eq(
            bruma.id
          )
          expect(embed_picker.embed.data[:products].last['id']).to eq(
            rollonMenta.id
          )
        end
      end
    end
  end
end