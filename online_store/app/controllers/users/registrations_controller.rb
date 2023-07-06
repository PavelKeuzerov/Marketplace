module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: %i[create update]
    # before_action :configure_sign_up_params, if: :devise_controller?

    def create
      super do |user|
        user.add_role(params[:role]) if user.persisted?
      end
    end

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[locale avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: %i[avatar])
    end
  end
end
