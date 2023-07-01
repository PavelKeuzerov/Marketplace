FactoryBot.define do
  factory :user do
    # association :products, factory: :product

    sequence(:email) { |i| "email#{i}@gmail.com" }
    password { 'test_password' }
    locale { 'en' }
  end
end
