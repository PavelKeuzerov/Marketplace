module Users
  class UserController < ApplicationController
    before_action :set_user, only: %i[show]

    def show
      @review = @user.reviews.build
      @reviews = @user.reviews.order created_at: :desc
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:user_id)
    end
  end
end
