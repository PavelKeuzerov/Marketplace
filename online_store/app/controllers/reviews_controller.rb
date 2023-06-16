class ReviewsController < ApplicationController
  before_action :set_product
  # before_action :set_review
  # before_action :set_reviewable
  def show; end

  def create
    # binding.pry
    @review = @product.reviews.build(review_params.merge(user_id: current_user.id))

    if @review.save
      redirect_to product_path(@product)
    else
      # @reviews = Review.all
      @reviews = @product.reviews
      render 'products/show'
    end
  end

  private

  def set_product
    # @product = @reviewable.is_a?(Product) ? @reviewabe : @reviewable.products
    @product = Product.find params[:product_id]
  end

  # def set_review
  #   binding.pry
  #   @review = @product.reviews.find params[:id]
  # end

  # def set_reviewable
  #   klass = [Product, User].detect { |c| params["#{c.name.underscore}_id"] }
  #   raise ActiveRecord::RecordNotFound if klass.blank?

  #   @reviewable = klass.find(["#{klass.name.underscore}_id"])
  # end

  def review_params
    # params.require(:review).permit(:body, :rating).merge(user_id: current_user.id)
    params.require(:review).permit(:body, :rating, :user_id, :reviewable_type, :reviewable_id)
  end
end