# module Carts
#   class InitializeCart
#     def carts
#       @cart ||= Cart.find_or_create_by(user: current_user)

#       return unless @cart.nil?

#       @cart = Cart.create
#     end
#   end
# end

module Carts
  class InitializeCart
    class << self
      def call(current_user)
        # binding.pry
        @cart ||= Cart.find_or_create_by(user: current_user)

        return unless @cart.nil?

        @cart = Cart.create
      end
    end
  end
end
