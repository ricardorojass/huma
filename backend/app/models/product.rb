class Product < ApplicationRecord
  belongs_to :category
  has_many :cart_items

  validates :name, presence: true
  validates :cost_price, presence: true
  validates :sale_price, presence: true

  has_one_attached :image

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
end
