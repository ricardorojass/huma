# frozen_string_literal: true

class CartItemPresenter < BasePresenter
  related_to    :product, :cart
  build_with    :id, :quantity, :product_id, :cart_id, :created_at, :updated_at
end
