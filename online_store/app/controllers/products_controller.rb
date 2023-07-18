class ProductsController < ApplicationController
  # before_action :set_product, only: %i[show edit update destroy]
  include ProductReview
  before_action :authenticate_user!, only: %i[edit create update new destroy show index]

  def index
    @products = Product.all
  end

  def search
    @product = ProductFilter::Search.call(params)
    if @product.present?
      @product
    else
      redirect_to products_path, notice: 'Not a valid combination'
    end
  end

  def show
    load_product_review
    # @product = Product.find(params[:id])
    # @review = @product.reviews.build
    # @reviews = @product.reviews.order created_at: :desc
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
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
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    authorize @product

    redirect_to products_path
  end

  private

  # def set_product
  #   @product = Product.find(params[:id])
  # end

  def product_params
    params.require(:product).permit(:name, :category, :product_detail, :price, :location, :availability, :user_id,
                                    pictures: []).merge(user_id: current_user.id)
  end
end
