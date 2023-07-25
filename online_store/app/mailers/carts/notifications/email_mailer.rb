module Carts
  module Notifications
    class EmailtMailer < ApplicationMailer
      def new_cart(user, product)
        @product = product
        @user = user
        @cart = cart
        mail(to: user.email, subject: 'Your shopping cart')
      end
    end
  end
end