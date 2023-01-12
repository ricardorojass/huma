module Queries
  class FetchProducts < Queries::BaseQuery
    type [Types::ProductType], null: false

    def resolve
      Product.all
    end
  end
end