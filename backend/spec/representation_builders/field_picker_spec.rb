# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'FieldPicker' do
  # We define 'let' in cascade where each one of them is used by the # one below. This allows us to override any of them easily in a
  # specific context.
  let(:bruma) { create(:product) }
  let(:params) { { fields: 'id,name' } }
  let(:presenter) { ProductPresenter.new(bruma, params) }
  let(:field_picker) { FieldPicker.new(presenter) }
  # We don't want our tests to rely too much on the actual implementation of # the book presenter. Instead, we stub the method 'build_attributes'
  # on ProductPresenter to always return the same list of attributes for
  # the tests in this file
  before do
    allow(ProductPresenter).to(
      receive(:build_attributes).and_return(%w[id name category_id])
    )
  end

  describe '#pick' do
    context 'with the "fields" parameter containing "id,name,description"' do
      it 'updates the presenter "data" with the product "id" and "name"' do
        expect(field_picker.pick.data).to eq({
          'id' => bruma.id,
          'name' => 'Bruma'
        })
      end

      context 'with overriding method defined in presenter' do
        # In this case, we want the presenter
        # in order to test the overriding system. To do this, the simplest
        # solution is to meta-programmatically add it.
        before { presenter.class.send(:define_method, :name) { 'Overridden!' } }
        it 'updates the presenter "data" with the name "Overridden!"' do
          expect(field_picker.pick.data).to eq({
            'id' => bruma.id,
            'name' => 'Overridden!'
          })
        end
        # Let's not forget to remove the method once we're done to
        # avoid any problem with other tests. Always clean up after your tests!
        after { presenter.class.send(:remove_method, :name) }
      end
    end

    context 'with no "fields" parameter' do
      let(:params) { {} }
      # I mentioned earlier how we can easily override any 'let'.
      # Here we just override the 'params' let which will be used in place # of the one we created earlier, but only in this context let(:params) { {} }
      it 'updates "data" with the fields ("id","name","category_id")' do
        expect(field_picker.send(:pick).data).to eq({
          'id' => bruma.id,
          'name' => 'Bruma',
          'category_id' => bruma.category_id
        })
      end
    end
  end
end