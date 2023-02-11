class ProductsController < ApplicationController

  def index
    products = orchestrate_query(Product.all)
    serializer = Huma::Serializer.new(data: products,
                                      params: params,
                                      actions: [:fields, :embeds])

    render json: serializer.to_json
  end

end