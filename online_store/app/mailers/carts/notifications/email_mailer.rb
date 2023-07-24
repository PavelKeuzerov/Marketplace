module Carts
  module Notifications
    class EmailtMailer < ApplicationMailer
      def new_cart(user, cart, product)
        @cart = cart
        @user = user
        @product = product
        mail(to: user.email, subject: 'New cart')
      end
    end
  end
end