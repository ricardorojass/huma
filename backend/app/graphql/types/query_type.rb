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

    # /cartItems
    field :cart_items, [Types::CartItemType], null: false
    # includes method is for eager loading that avoid N+1
    def cart_items
      CartItem.includes(:product).all
    end

  end
end
