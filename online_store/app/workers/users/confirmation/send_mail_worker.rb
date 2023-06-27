module Users
  module Confirmation
    class SendMailWorker
      include Sidekiq::Worker

      sidekiq_options queue: :my_first_queue

      def perform(user_id)
        SendMail.call(user_id)
      end
    end
  end
end