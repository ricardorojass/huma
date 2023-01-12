class Product < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :cost_price, presence: true
  validates :sale_price, presence: true

  mount_base64_uploader :thumbnail, ThumbnailUploader
end
