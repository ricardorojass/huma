FactoryBot.define do
  factory :coupon do
    code { "MyString" }
    discount { 1.5 }
    valid_from { "2023-01-10 22:35:04" }
    valid_until { "2023-01-10 22:35:04" }
    max_uses { 1 }
    uses { 1 }
    active { false }
  end
end
