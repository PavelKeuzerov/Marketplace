class ReviewMailer < ApplicationMailer
  def new_review(user, review)
    @review = review
    mail(
      to: user.email,
      subject: 'New review'
    )
  end
end
