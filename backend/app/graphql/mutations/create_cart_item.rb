class Mutations::CreateCartItem < Mutations::BaseMutation
  argument :user_id, ID, required: false
  argument :product_id, ID, required: true

  field :cart_item, Types::CartItemType, null: true
  field :errors, [String], null: false

  def resolve(user_id:, product_id:)
    user_id = nil unless user_id.nil?
    cart_item = CartItem.new(product_id: product_id, user_id: user_id)
    if cart_item.save
      {
        cart_item: cart_item,
        errors: []
      }
    else
      {
        cart_item: nil,
        errors: cart_item.errors.full_messages
      }
    end
  end
end