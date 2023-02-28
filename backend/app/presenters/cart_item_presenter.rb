# frozen_string_literal: true

class CartItemPresenter < BasePresenter
  related_to    :product, :user
  build_with    :id, :product_id, :user_id, :created_at, :updated_at
end
