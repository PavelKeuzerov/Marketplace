class ReviewsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy create]
  before_action :set_review, only: %i[edit update destroy]

  def update
    if @review.update(review_params.merge(user_id: current_user.id))
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def edit
    authorize @review
  end

  def create
    @review = @product.reviews.build(review_params.merge(user_id: current_user.id))
    authorize @review
    if @review.save
      redirect_to product_path(@product)
    else
      @reviews = @product.reviews.order created_at: :desc
      render 'products/show'
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def set_product
    @product = Product.find params[:product_id]
  end

  def set_review
    @review = @product.reviews.find params[:id]
  end

  def review_params
    params.require(:review).permit(:body, :rating, :user_id, :reviewable_type, :reviewable_id)
  end
end
