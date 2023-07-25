FactoryBot.define do
  factory :product do
    association :user, factory: :user

    name { 'plate' }
    category { 'dishess' }
    product_detail { 'glas' }
    price { 55 }
    location { 'london' }
    availability { 'in stock' }
    user_id { 14 }
  end
end
