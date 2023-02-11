FactoryBot.define do
  factory :category do
    name { 'bienestar' }
    description { '' }
  end

  factory :facial, class: Category do
    name { 'facial' }
    description { '' }
  end
end
