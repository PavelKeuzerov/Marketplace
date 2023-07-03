class CartMailWorker
  include Sidekiq::Worker

  sidekiq_options queue: :cart_queue

  def perform
    @cart_mail = @product.user, @cart
    mail(to: user.email, subject: 'New cart')
  end
end
