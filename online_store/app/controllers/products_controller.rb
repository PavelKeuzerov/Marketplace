class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[edit create update new destroy]

  # caches_action :index

  def index
    @products = Product.all
  end

  def show
    @review = @product.reviews.build
    @reviews = @product.reviews.order created_at: :desc
  end

  def new
    @product = Product.new
  end

  def edit
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product

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
    @product.destroy(product_params)
    authorize @product

    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :category, :product_detail, :price, :location, :availability, :user_id,
                                    pictures: []).merge(user_id: current_user.id)
  end
end
