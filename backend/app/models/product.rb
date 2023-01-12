class Product < ApplicationRecord
  validates :name, presence: true
  validates :cost_price, presence: true
  validates :sale_price, presence: true
end
