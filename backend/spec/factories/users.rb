FactoryBot.define do
  factory :user, aliases: [:richi] do
    name { "Ricardo Rojas" }
    email { "reddrum7@gmail.com" }
    password { "123456" }
  end

  factory :vane, class: User do
    name { "Vanessa Bobadilla" }
    email { "vanessa@gmail.com" }
    password { "123456" }
  end
end
