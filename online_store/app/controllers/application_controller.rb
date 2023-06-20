class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError do |_e|
    render json: { message: 'No access' }, status: 403
  end

  before_action :set_locale

  # def current_cart
  #   @current_cart ||= Cart.find_or_create_by(user: current_user)
  # end

  # def cart_items
  #   current_cart.cart_items
  # end

  # helper_method :current_cart, :cart_items

  private

  def set_locale
    I18n.locale = if user_signed_in?
                    current_user.locale
                  else
                    I18n.default_locale
                  end
    Rails.logger.info("CURRENT LOCALE #{I18n.locale}")
  end
end
