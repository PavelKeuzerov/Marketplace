module Users
  module Confirmation
    class EmailMailer < ApplicationMailer
      def confirm_mail(user)
        @user = user

        mail(to: @user.email, subject: 'Please confirm your email')
      end
    end
  end
end
