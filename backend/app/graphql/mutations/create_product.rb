class Mutations::CreateProduct < Mutations::BaseMutation
  argument :name, String, required: true
  argument :description, String, required: true
  argument :cost_price, Float, required: true
  argument :sale_price, Float, required: true

  field :product, Types::ProductType, null: false
  field :errors, [String], null: false

  def resolve(name:, description:)
    product = Product.new(name: name, description: description, cost_price: cost_price, sale_price: sale_price)

    if product.save
      {
        product: product,
        errors: []
      }
    else
      {
        product: nil,
        errors: product.errros.full_messages
      }
    end
  end
end