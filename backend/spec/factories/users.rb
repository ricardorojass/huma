FactoryBot.define do
  factory :user do
    name { 'Ricardo Rojas' }
    email { 'reddrum7@gmail.com' }
    password { '12345678' }
    role { :user }

    trait :confirmation_redirect_url do
      confirmation_token { '123' }
      confirmation_redirect_url { 'http://google.com' }
    end

    trait :confirmation_no_redirect_url do
      confirmation_token { '123' }
      confirmation_redirect_url { nil }
    end

    trait :reset_password do
      reset_password_token { '123' }
      reset_password_redirect_url { 'http://example.com?some=params' }
      reset_password_sent_at { Time.now }
    end

    trait :reset_password_no_params do
      reset_password_token { '123' }
      reset_password_redirect_url { 'http://example.com' }
      reset_password_sent_at { Time.now }
    end
  end
end
