module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]

    def create
      super do |user|
        user.add_role(params[:role]) if user.persisted?
      end
    end

    protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: %i[locale avatar])
    end
  end
end
