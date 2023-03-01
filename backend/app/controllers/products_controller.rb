class ProductsController < ApplicationController

  def index
    products = orchestrate_query(Product.all)
    render serialize(products)
  end

  def show
    render serialize(product)
  end

  def create
    path = params[:product][:image].tempfile.path
    ImageProcessing::MiniMagick
      .source(path)
      .resize_to_limit(1200, 1200)
      .call(destination: path)

    product = Product.new(product_params)
    product.category = Category.find(params[:product][:category_id])
    if product.save
      render serialize(product).merge(status: :created, location: product)
    else
      unprocessable_entity!(product)
    end
  end

  def update
    image_file = params[:data][:image]
    if image_file.present?
      product.image.attach(image_file)
    end
    if product.update(product_params)
      render serialize(product).merge(status: :ok)
    else
      unprocessable_entity!(product)
    end
  end

  def destroy
    product.destroy
    render status: :no_content
  end

  private

  def product
    @product ||= params[:id] ? Product.find_by!(id: params[:id]) : Product.new(product_params)
  end
  alias_method :resource, :product

  def product_params
    params.require(:product).permit(:name, :description, :cost_price, :sale_price,
                                 :purchase_price, :active, :created_at, :updated_at,
                                 :category_id, :image)
  end
end
