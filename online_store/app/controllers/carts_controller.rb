class CartsController < ApplicationController
  before_action :set_cart_item, only: %i[remove]

  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_cart_item = @cart.cart_items.find_by(product_id: @product.id)
    if current_cart_item && quantity.positive?
      current_cart_item.update(quantity:)
    elsif quantity <= 0
      current_cart_item.destroy
    else
      @cart.cart_items.create(product: @product, quantity:)
    end
  end

  def remove
    if @cart_item.destroy
      # head :no_content
    else
      redirect_to carts_path
      # render json: { error: @cart_item.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end
