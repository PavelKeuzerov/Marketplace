module Carts
  module Notifications
    class SendMailWorker
      include Sidekiq::Worker

      sidekiq_options queue: :mailers

      def perform(cart_id, product_id)
        SendMail.call(product_id.current_user_id, cart_id)
      end
    end
  end
end