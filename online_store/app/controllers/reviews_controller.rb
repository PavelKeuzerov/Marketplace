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
      # ReviewMailer.new_review(@product.user, @review).deliver_now
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

# class ReviewsController < ApplicationController
#   # REVIEWABLE_TYPE_TO_DB_VIEW = {
#   #   'user' => User.name,
#   #   'product' => Product.name
#   # }.freeze
#   before_action :set_reviewable
#   before_action :set_review, only: %i[edit update destroy create]

#   def update
#     if @review.update(review_params.merge(user_id: current_user.id))
#       redirect_to product_path(@product)
#     else
#       render :edit
#     end
#   end

#   def edit
#     authorize @review
#   end

#   def create
#     @review = @reviewable.reviews.build(review_params.merge(user_id: current_user.id))
#     authorize @review
#     if @review.save
#       redirect_to product_path(@product)
#     else
#       # @reviews = @product.reviews.order created_at: :desc
#       render 'products/show'
#     end
#   end

#   def destroy
#     authorize @review
#     @review.destroy
#     redirect_to product_path(@product)
#   end

#   private

#   def set_reviewable
#     klass = [Product, User].detect { |c| params["#{c.name.underscore}_id"] }
#     raise ActiveRecord::RecordNotFound if klass.blank?

#     @reviewable = klass.find(params["#{klass.name.underscore}_id"])
#   end

#   def set_review
#     @product = @reviewable.is_a?(Review) ? @reviewable : @reviewable.product
#   end

#   #  def set_review
#   #   @review = Review.find(params[:id])
#   # end

#   def set_product
#     @product = Product.find params[:product_id]
#   end

#   def review_params
#     params.require(:review).permit(:body, :rating, :user_id, :reviewable_type, :reviewable_id).to_h
#   end
# end

# def set_reviewable
#   klass = [Product, User].detect { |c| params["#{c.name.underscore}_id"] }
#   raise ActiveRecord::RecordNotFound if klass.blank?

#   @reviewable = klass.find(params["#{klass.name.underscore}_id"])
# end

# def set_review
#   @product = @reviewable.is_a?(Review) ? @reviewable : @reviewable.product
# end

# def create
#   @review = @reviewable.reviews.build(review_params)
# end
