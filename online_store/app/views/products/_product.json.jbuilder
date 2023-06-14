json.extract! product, :id, :name, :category, :product_detail, :price, :location, :availability, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
