class ProductPresenter < BasePresenter
  build_with  :id, :name, :description, :cost_price, :sale_price,
              :purchase_price, :active, :created_at, :updated_at,
              :thumbnail, :category_id

  def thumbnail
    @object.thumbnail.url.to_s
  end

end