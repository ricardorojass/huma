module Types
  class MutationType < Types::BaseObject
    field :create_product, mutation: Mutations::CreateProduct
    field :create_cart_item, mutation: Mutations::CreateCartItem
  end
end
