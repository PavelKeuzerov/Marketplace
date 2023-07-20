module ProductReview
  extend ActiveSupport::Concern

  included do
    def load_product_review
      @product = Product.find(params[:id])
      fresh_when last_modified: @product.published_at.utc, etag: @product
      @review ||= @product.reviews.build
      @reviews = @product.reviews.order created_at: :desc
    end
  end
end
