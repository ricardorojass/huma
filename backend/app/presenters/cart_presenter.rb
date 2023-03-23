# frozen_string_literal: true

class CartPresenter < BasePresenter
  related_to    :user, :cart_items
  build_with    :id, :quantity, :user_id, :created_at, :updated_at
end