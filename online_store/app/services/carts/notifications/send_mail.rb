module Carts
  module Notifications
    class SendMail
      class << self
        def call(product_id, user_id, cart_id)
          product = Product.find(product_id)
          product.user = User.find(user_id)
          cart = Cart.find(cart_id)

          Carts::Notifications::EmailMailer.new_cart(product.user, cart).deliver_now
        end
      end
    end
  end
end
