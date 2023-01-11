FactoryBot.define do
  factory :customer do
    user { nil }
    full_name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    department { "MyString" }
    phone_number { "MyString" }
  end
end
