FactoryBot.define do
  factory :review do
    body { "MyString" }
    rating { "" }
    reviewable { nil }
    user { nil }
  end
end
