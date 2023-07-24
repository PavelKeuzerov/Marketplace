module Carts
  module Notifications
    class SendMailWorker
      include Sidekiq::Worker

      sidekiq_options queue: :mailers

      def perform(product, user, cart)
        SendMail.call(product, user, cart)
      end
    end
  end
end