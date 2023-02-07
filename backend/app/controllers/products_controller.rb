class ProductsController < ApplicationController

  def index
    products = Product.all.map do |product|
      FieldPicker.new(ProductPresenter.new(product, params)).pick
    end

    render json: { data: products }.to_json
  end

end