FactoryBot.define do
  factory :user do
    name { "egg" }
    prefecture { "東京都" }
    cities { "千代田区" }
    email { "test@gmail.com" }
    password { "rspectest" }
  end
end
