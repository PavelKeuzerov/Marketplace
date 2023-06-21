class User < ApplicationRecord
  rolify
  AVAILABLE_LOCALES = %w[en ru].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :products
  has_many :reviews, as: :reviewable, dependent: :destroy
  # has_one :cart

  validates :avatar, blob: { content_type: %w[image/png image/jpg image/jpeg], size_range: 1..5.megabytes }
  validates :email,    presence: true
  validates :password, presence: true

  after_create :assign_default_role

  private

  def assign_default_role
    add_role(Role::USER) if roles.blank?
  end
end
