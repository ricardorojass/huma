class ProductPresenter < BasePresenter
  build_with  :id, :name, :description, :cost_price, :sale_price,
              :purchase_price, :active, :created_at, :updated_at,
              :thumbnail, :category_id
  related_to  :category, :cart_items
  sort_by     :id, :name, :created_at, :updated_at
  filter_by   :id, :name, :active, :created_at, :category_id,


  def thumbnail
    @object.thumbnail.url.to_s
  end

end