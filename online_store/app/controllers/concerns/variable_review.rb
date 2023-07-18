module VariableReview
  extend ActiveSupport::Concern

  included do
    def load_variable_review
      @product = Product.find params[:product_id]
      @review = @product.reviews.find params[:id]
    end
  end
end