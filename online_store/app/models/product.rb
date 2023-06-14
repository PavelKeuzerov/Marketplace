class Product < ApplicationRecord
  # has_many :reviews, dependent: :destroy
  belongs_to :user
  
  has_many_attached :pictures

  validates :name, presence: true, length: { minimum: 2 }
  validates :product_detail, presence: true, length: { maximum: 255 }
  validates :price, presence: true
  validates :location, presence: true
  validates :pictures, blob: { content_type: %w[image/png image/jpg image/jpeg], size_range: 1..5.megabytes }
end
