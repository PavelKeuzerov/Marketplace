module Carts
  class Add
    class << self
      def call
        # @product = Product.find_by(id: params[:id])
        # quantity = params[:quantity].to_i
        current_cart_item = @cart.cart_items.find_by(product_id: @product.id)
        if current_cart_item && quantity.positive?
          current_cart_item.update(quantity:)
        elsif quantity <= 0
          current_cart_item.destroy
        else
          @cart.cart_items.create(product: @product, quantity:)
          # CartMailWorker.perform_async(@cart_mail)
          # CartMailer.perform(@product.user, @cart).deliver_later
          redirect_to carts_path
        end
      end
    end
  end
end
