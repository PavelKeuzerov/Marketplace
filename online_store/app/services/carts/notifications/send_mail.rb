module Carts
  module Notifications
    class SendMail
      class << self
        def call(cart_id, product_id, current_user_id)
          cart = User.find(cart_id)
          product = Product.find(product_id)
          user = User.find(current_user_id)
          # @cart_mail = product.user, cart

          Carts::Notifications::EmailMailer.new_cart(cart, product, user).deliver_now
        end
      end
    end
  end
end
