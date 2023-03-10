FactoryBot.define do
  factory :access_token do
    token_digest { nil }
    accessed_at { "2023-03-07 19:08:48" }
    user
    api_key
  end
end
