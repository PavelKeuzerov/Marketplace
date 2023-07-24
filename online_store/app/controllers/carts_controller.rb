class CartsController < ApplicationController
  include VariableCart
  before_action :authenticate_user!
  before_action :initialize_cart, only: %i[add]

  def show
    @render_cart = false
  end

  def add
    @product = Product.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_cart_item = @cart.cart_items.find_by(product_id: @product.id)
    if current_cart_item && quantity.positive? && @product
      current_cart_item.update(quantity:)
    elsif quantity <= 0
      current_cart_item.destroy
    else
      @cart.cart_items.create(product: @product, quantity:)
      # send_mail(@product.user, @cart)
      redirect_to carts_path
    end
  end

  def remove
    CartItem.find(params[:id]).destroy
    redirect_to carts_path
  end

  private

  def initialize_cart
    load_variable_cart
  end

  # def send_mail(product, cart)
  #   product_id = product.id
  #   user_id = user_id.instance_of?(User) ? user.id : @product.user_id
  #   cart_id = cart.id
  #   Carts::Notifications::SendMailWorker.perform_async(product_id, user_id, cart_id)
  # end
end
