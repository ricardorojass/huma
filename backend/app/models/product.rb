class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items
  has_many :cart_items

  monetize :price_cents

  validates :name, presence: true

  has_one_attached :image

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
end
