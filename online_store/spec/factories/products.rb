FactoryBot.define do
  factory :product do
    name { 'MyString' }
    category { 'MyString' }
    product_detail { 'MyString' }
    price { '9.99' }
    location { 'MyString' }
    availability { 'MyString' }
    user_id { '' }
  end
end
