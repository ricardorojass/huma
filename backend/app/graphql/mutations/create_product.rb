class Mutations::CreateProduct < Mutations::BaseMutation
  argument :name, String, required: true
  argument :description, String, required: true
  argument :category, String, required: true
  argument :costPrice, Float, required: true
  argument :salePrice, Float, required: true
  argument :image, ApolloUploadServer::Upload, required: false

  field :product, Types::ProductType, null: true
  field :errors, [String], null: false

  def resolve(name:, description:, category:,  costPrice:, salePrice:, image:)
    categoryRecord = Category.find_by(name: category)
    blob = ActiveStorage::Blob.create_and_upload!(
      io: image,
      filename: image.original_filename,
      content_type: image.content_type
    )
    product = Product.new(
      name: name,
      description: description,
      category: categoryRecord,
      cost_price: costPrice,
      sale_price: salePrice,
      thumbnail: blob
    )

    if product.save
      {
        product: product,
        errors: []
      }
    else
      {
        product: nil,
        errors: product.errors.full_messages
      }
    end
  end
end