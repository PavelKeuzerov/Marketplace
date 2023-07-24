module Carts
  module Notifications
    class CartMailWorker
      include Sidekiq::Worker

      sidekiq_options queue: :mailers

      def perform
        @cart_mail = @product.user, @cart
        mail(to: user.email, subject: 'New cart')
      end
    end
  end
end