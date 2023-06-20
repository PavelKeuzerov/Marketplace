class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  validates :body, presence: true, length: { minimum: 2 }
  validates :rating, presence: true, numericality: { in: 0..5, message: ' is set from 1 to 5' }
  # validates :user_id, uniqueness: { scope: :product_id, message: 'You have already written a review. You can correct your old review.' }

end

#  t.index ["user_id", "product_id"], name: "index_reviews_on_user_id_and_product_id", unique: true