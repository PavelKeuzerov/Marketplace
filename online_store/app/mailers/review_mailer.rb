class ReviewMailer < ApplicationMailer
  include Sidekiq::Worker

  sidekiq_options queue: :review

  def perform(user, review)
    @review = review
    mail(
      to: user.email,
      subject: 'New review'
    )
  end
end
