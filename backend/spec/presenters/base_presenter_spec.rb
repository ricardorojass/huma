
require 'rails_helper'
RSpec.describe BasePresenter do
  # Let's create a subclass to avoid polluting
  # the BasePresenter class
  class Presenter < BasePresenter; end
  let(:presenter) { Presenter.new('fake', { something: 'cool' }) }
  describe '#initialize' do
    it 'sets the "object" variable with "fake"' do
      expect(presenter.object).to eq 'fake'
    end

    it 'sets the "params" variable with { something: "cool" }' do
      expect(presenter.params).to eq({ something: 'cool' })
    end

    it 'initializes "data" as a HashWithIndifferentAccess' do
      expect(presenter.data).to be_kind_of(HashWithIndifferentAccess)
    end
  end
  describe '#as_json' do
    it 'allows the serialization of "data" to json' do
      presenter.data = { something: 'cool' }
      expect(presenter.to_json).to eq '{"something":"cool"}'
    end
  end

  describe '.build_with' do
    it 'stores ["id", "name"] in "build_attributes"' do
      Presenter.build_with :id, :name
      expect(Presenter.build_attributes).to eq ['id', 'name']
    end
  end

  describe '.related_to' do
    it 'stores the correct value' do
      Presenter.related_to :cart_items, :category
      expect(Presenter.relations).to eq ['cart_items', 'category']
    end
  end

  describe '.sort_by' do
    it 'stores the correct value' do
      Presenter.sort_by :id, :name
      expect(Presenter.sort_attributes).to eq ['id', 'name']
    end
  end

  describe '.filter_by' do
    it 'stores the correct value' do
      Presenter.filter_by :name
      expect(Presenter.filter_attributes).to eq ['name']
    end
  end
end