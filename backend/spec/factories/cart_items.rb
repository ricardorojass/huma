FactoryBot.define do
  factory :cart_item do
    cart { nil }
    product { nil }
    quantity { 1 }
  end
end
