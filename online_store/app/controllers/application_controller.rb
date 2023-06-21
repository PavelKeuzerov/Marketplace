class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError do |_e|
    render json: { message: 'No access' }, status: 403
  end

  before_action :set_locale
  before_action :set_render_cart
  before_action :initialize_cart

  private

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    return unless @cart.nil?

    @cart = Cart.create
    session[:cart_id] = @cart.id
  end

  def set_render_cart
    @render_cart = true
  end

  def set_locale
    I18n.locale = if user_signed_in?
                    current_user.locale
                  else
                    I18n.default_locale
                  end
    Rails.logger.info("CURRENT LOCALE #{I18n.locale}")
  end
end
