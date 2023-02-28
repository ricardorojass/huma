FactoryBot.define do
  factory :cart1, class: CartItem do
    product { association :product }
    user { nil }
    quantity { 1 }
  end

  factory :cart2, class: CartItem do
    product { association :rollonMenta }
    user { nil }
    quantity { 1 }
  end
end
