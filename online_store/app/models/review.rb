class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  validates :body, presence: true, length: { minimum: 2 }
  validates :rating, presence: true, numericality: { in: 0..5, message: ' is set from 1 to 5' }
end
