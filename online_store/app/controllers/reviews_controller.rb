class ReviewsController < ApplicationController
  def update
    @product, @review = ReviewVariable::Review.call(params)

    if @review.update(review_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def edit
    @product, @review = ReviewVariable::Review.call(params)
    authorize @review
  end

  def create
    @product, @review = ReviewVariable::ReviewCreate.call(params, review_params)
    authorize @review
    if @review.save
      redirect_to product_path(@product)
    else
      @product, @review, @reviews = ReviewVariable::ProductReview.call(params)
    end
  end

  def destroy
    @product, @review = ReviewVariable::Review.call(params)
    authorize @review
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :user_id, :reviewable_type, :reviewable_id)
          .merge(user_id: current_user.id)
  end
end
