# frozen_string_literal: true

module Types
  class CategoryType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :description, String
    field :product_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :products, [Types::ProductType], null: false
    field :category_count, Integer, null: true

    def category_count
      object.categories.size
    end
  end
end
