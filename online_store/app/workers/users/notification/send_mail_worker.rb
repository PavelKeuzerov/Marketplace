module Users
  module Notification
    class SendMailWorker
      include Sidekiq::Worker

      sidekiq_options queue: :mailers

      def perform(user_id)
        SendMail.call(user_id)
      end
    end
  end
end