module Types
  class QueryType < Types::BaseObject
    # /products
    field :products, [Types::ProductType], null: false
    def products
      Product.active
    end

    field :product, Types::ProductType, null: false do
      argument :id, ID, required: true
    end
    def product(id:)
      Product.active.find(id)
    end

    # /categories
    field :categories, [Types::CategoryType], null: false
    def categories
      Category.all
    end

    field :category, Types::CategoryType, null: false do
      argument :name, String, required: true
    end
    def category(name: nil)
      Category.find_by(name: name)
    end

    field :fetch_users, resolver: Queries::FetchUsers
  end
end
