FactoryBot.define do
  factory :card_post do
    user { nil }
    store_name { "MyString" }
    card_name { "MyString" }
    price { 1 }
    memo { "MyText" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
