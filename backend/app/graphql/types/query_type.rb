module Types
  class QueryType < Types::BaseObject
    # /products
    # field :products, [Types::ProductType], null: false

    # def Products
    #   Product.all
    # end

    field :fetch_users, resolver: Queries::FetchUsers
    field :fetch_products, resolver: Queries::FetchProducts
  end
end
