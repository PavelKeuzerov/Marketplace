class ProductsController < ApplicationController
  include VariableCart
  before_action :authenticate_user!, only: %i[edit create update new destroy show]
  before_action :initialize_cart, only: %i[index]
  caches_page :index

  def index
    @q, @products = ProductFilter::Search.call(params)
    if @products.present?
      @products
    else
      redirect_to products_path, notice: 'Not a valid combination'
    end

    @render_cart = true
  end

  def show
    @product, @review, @reviews = ReviewVariable::ProductReview.call(params)
    # fresh_when last_modified: @product.created_at.utc, etag: @product
    # fresh_when last_modified: @review.updated_at, etag: @product.reviews.cache_key_with_version
    fresh_when last_modified: @product.updated_at
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
    authorize @product
  end

  def create
    expire_page :action => :index
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

  def initialize_cart
    load_variable_cart
  end

  def product_params
    params.require(:product).permit(:name, :category, :product_detail, :price, :location, :availability, :user_id,
                                    pictures: []).merge(user_id: current_user.id)
  end
end
