module Users
  module Notification
    class SendMail
      class << self
        def call(user_id)
          user = User.find(user_id)

          Users::Notification::EmailMailer.greeting_mail(user).deliver_now
        end
      end
    end
  end
end