class ProductPresenter < BasePresenter
  include Rails.application.routes.url_helpers

  build_with  :id, :name, :description, :cost_price, :sale_price,
              :purchase_price, :active, :created_at, :updated_at,
              :image, :category_id
  related_to  :category, :cart_items
  sort_by     :id, :name, :created_at, :updated_at
  filter_by   :id, :name, :active, :created_at, :category_id


  def image 
    url_for(object.image) if object.image.attached?
  end

end
