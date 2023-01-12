# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :cost_price, Float
    field :sale_price, Float
    field :purchase_price, Float
    field :active, Boolean
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :thumbnail, String
    field :products_count, Integer, null: true

    def products_count
      object.products.size
    end
  end
end
