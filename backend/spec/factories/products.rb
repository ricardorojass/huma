FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    cost_price { "9.99" }
    sale_price { "9.99" }
    purchase_price { "9.99" }
    active { false }
    coupon { nil }
  end
end
