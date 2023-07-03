class CartMailer < ApplicationMailer
  include Sidekiq::Worker

  sidekiq_options queue: :carts

  def perform(user, cart)
    @cart = cart
    mail(
      to: user.email,
      subject: 'New cart'
    )
  end
end
