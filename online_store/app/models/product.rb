class Product < ApplicationRecord
  belongs_to :user, optional: true
  has_many_attached :pictures
  has_many :reviews, as: :reviewable, dependent: :destroy
  has_many :cart_items
  has_many :carts, through: :cart_items

  validates :name, presence: true, length: { minimum: 2 }
  validates :product_detail, presence: true, length: { maximum: 255 }
  validates :price, presence: true
  validates :location, presence: true
  validates :pictures, blob: { content_type: %w[image/png image/jpg image/jpeg], size_range: 1..5.megabytes }
  validates :availability, presence: true, inclusion: { in: ['in stock', 'out of stock'],
                                                        message: '%<value>s is not a valid' }

  scope :in_stock, -> { where(availability: 'in stock') }
end
