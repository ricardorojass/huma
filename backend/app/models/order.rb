class Order < ApplicationRecord
  belongs_to :user
  belongs_to :coupon, optional: true
  has_many :order_items
  has_one :payment

  monetize :shipping_cents
  monetize :total_amount_cents
  monetize :discounted_amount_cents
end
