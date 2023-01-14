FactoryBot.define do
  factory :order do
    customer { nil }
    total { 1.5 }
    discount_total { 1.5 }
    coupon_code { 'MyString' }
    status { 1 }
  end
end
