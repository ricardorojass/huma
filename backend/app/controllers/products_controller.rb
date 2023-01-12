
class ProductsController < ApplicationController

  def index
    render json: { data: Products.all }
  end

end