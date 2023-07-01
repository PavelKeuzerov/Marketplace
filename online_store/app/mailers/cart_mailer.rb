class CartMailer < ApplicationMailer
  def new_cart(user, cart)
    @cart = cart
    mail(
      to: user.email,
      subject: 'New cart'
    )
  end
end
