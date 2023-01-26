FactoryBot.define do
  factory :cart_item do
    product { nil }
    user { nil }
    quantity { 1 }
  end
end
