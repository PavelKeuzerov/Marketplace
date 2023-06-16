class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[edit create update new destroy]

  def index
    @products = Product.all
  end

  def show
    @review = @product.reviews.build
    # @reviews = Review.all
    @reviews = @product.reviews
  end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    @product = Product.new(product_params.merge(user_id: current_user.id))

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy

    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category, :product_detail, :price, :location, :availability, :user_id,
                                    pictures: [])
  end
end
