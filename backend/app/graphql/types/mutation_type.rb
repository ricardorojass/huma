module Types
  class MutationType < Types::BaseObject
    field :create_product, mutation: Mutations::CreateProduct
    field :create_cart_item, mutation: Mutations::CreateCartItem
    field :create_user, mutation: Mutations::CreateUser
    field :sign_in_user, mutation: Mutations::SignInUser
    field :sign_out, mutation: Mutations::SignOut
  end
end
