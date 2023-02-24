FactoryBot.define do
  factory :category do
    name { 'Bienestar' }
    description { 'Categoria de Bienestar' }

    trait :with_products do
      transient do
        products_count { 1 }
      end
      
      after(:create) do |category, evaluator|
        create_list(:product, evaluator.products_count, category: category)
      end
    end
  end

  factory :facial, class: Category do
    name { 'Facial' }
    description { 'Categoria facial' }

    trait :with_products do
      transient do
        products_count { 1 }
      end
      
      after(:create) do |category, evaluator|
        create_list(:product, evaluator.products_count, category: category)
      end
    end
  end

  factory :capilar, class: Category do
    name { 'Capilar' }
    description { 'Categoria capilar' }

    trait :with_products do
      transient do
        products_count { 1 }
      end
      
      after(:create) do |category, evaluator|
        create_list(:product, evaluator.products_count, category: category)
      end
    end
  end

  factory :aceitesEsenciales, class: Category do
    name { 'Aceites Esenciales' }
    description { 'Categoria de Aceites' }

    trait :with_products do
      transient do
        products_count { 1 }
      end
      
      after(:create) do |category, evaluator|
        create_list(:product, evaluator.products_count, category: category)
      end
    end
  end
end
