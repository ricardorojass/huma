# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    include ActionController::UrlFor
    include Rails.application.routes.url_helpers

    field :id, ID, null: false
    field :name, String
    field :description, String
    field :cost_price, Float
    field :sale_price, Float
    field :purchase_price, Float
    field :active, Boolean
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :thumbnail, String, null: true
    field :products_count, Integer, null: true
    field :category, Types::CategoryType, null: false
    field :cart_items, [Types::CartItemType], null: false

    def products_count
      object.products.size
    end

    def thumbnail
      Rails.application.routes.url_helpers.rails_blob_url(
        object.thumbnail,
        protocol: ActiveStorage::Current.url_options[:protocol],
        host: ActiveStorage::Current.url_options[:host],
        port: ActiveStorage::Current.url_options[:port]
      ) if object.thumbnail.attached?
    end

    def cart_items
      object.cart_items
    end
  end
end
