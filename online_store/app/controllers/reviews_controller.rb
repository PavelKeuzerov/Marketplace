class ReviewsController < ApplicationController
  include ProductReview
  include VariableReview

  def update
    load_variable_review
    if @review.update(review_params.merge(user_id: current_user.id))
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def edit
    load_variable_review
    authorize @review
  end

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.build(review_params.merge(user_id: current_user.id))
    authorize @review
    if @review.save
      redirect_to product_path(@product)
    else
      load_product_review
    end
  end

  def destroy
    load_variable_review
    authorize @review
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :user_id, :reviewable_type, :reviewable_id)
  end
end
