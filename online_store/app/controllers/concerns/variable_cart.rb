module VariableCart
  extend ActiveSupport::Concern

  included do
    def load_variable_cart
      @cart ||= Cart.find_or_create_by(user: current_user)

      return unless @cart.nil?

      @cart = Cart.create
    end
  end
end