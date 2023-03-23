FactoryBot.define do
  factory :payment do
    order { nil }
    payment_method { "MyString" }
    amount { "" }
    idempotency_key { "MyString" }
    status { 1 }
    charge_id { "MyString" }
    error { "MyText" }
  end
end
