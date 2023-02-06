class ProductsController < ApplicationController
include ActiveStorage::SetCurrent

  def index
    render json: { data: Product.all }
  end

end