FactoryBot.define do
  factory :product, class: Product do
    name { "Bruma" }
    description { "Ideal para el sueno" }
    cost_price { "8.000" }
    sale_price { "12.000" }
    purchase_price { "" }
    active { true }
  end

  factory :rollonMenta, class: Product do
    name { "Roll on Menta" }
    description { "Ideal para dolor de cabeza" }
    cost_price { "10.000" }
    sale_price { "24.000" }
    purchase_price { "" }
    active { true }
  end
end
