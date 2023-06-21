class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  # belongs_to :user

  def total
    cart_items.to_a.sum { |cart_items| cart_items.total }
  end
end
