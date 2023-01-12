class ProductsController < ApplicationController

  def index
    render json: { data: Product.all }
  end

end