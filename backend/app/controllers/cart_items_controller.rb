class CartItemsController < ApplicationController

  def index
    cart_items = orchestrate_query(CartItem.all)
    binding.pry
    render serialize(cart_items)
  end

  def show
    render serialize(cart_item)
  end

  def create
    if cart_item.save
      render serialize(cart_item).merge(status: :created, location: cart_item)
    else
      unprocessable_entity!(cart_item)
    end
  end

  def update
    if cart_item.update(cart_item_params)
      render serialize(cart_item).merge(status: :ok)
    else
      unprocessable_entity!(cart_item)
    end
  end

  def destroy
    cart_item.destroy
    render status: :no_content
  end

  private

  def cart_item 
    @cart_item ||= params['id'] ? CartItem.find_by!(id: params[:id]) :
                                 CartItem.new(cart_item_params)
  end
  alias_method :resource, :cart_item
  
  def cart_item_params
    params.require(:data).permit(:quantity, :product_id, :user_id)
  end
end
