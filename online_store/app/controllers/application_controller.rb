class ApplicationController < ActionController::Base
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError do |_e|
    render json: { message: 'No access' }, status: 403
  end

  before_action :set_locale

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
