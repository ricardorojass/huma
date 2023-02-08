FactoryBot.define do
  factory :product do
    name { 'Bruma' }
    description { 'Ideal para el sueno' }
    cost_price { '8.000' }
    sale_price { '12.000' }
    purchase_price { '' }
    active { true }
    association :category
  end

  factory :rollonMenta, class: Product do
    name { 'Roll on Menta' }
    description { 'Ideal para dolor de cabeza' }
    cost_price { '10.000' }
    sale_price { '24.000' }
    purchase_price { '' }
    active { true }
    association :category
  end

  factory :velaSandia, class: Product do
    name { 'Vela de Soya Sandia' }
    description { 'Ultrahidratante natural' }
    cost_price { '16.000' }
    sale_price { '19.000' }
    purchase_price { '' }
    active { true }
    association :category
  end
end
