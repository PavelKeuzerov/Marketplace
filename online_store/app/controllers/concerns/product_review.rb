module ProductReview
  extend ActiveSupport::Concern

  included do
    def load_product_review
      @product = Product.find(params[:id])
      # return unless stale?(@product)

      fresh_when last_modified: @product.created_at.utc, etag: @product
      @review ||= @product.reviews.build
      @reviews = @product.reviews.order created_at: :desc
      fresh_when last_modified: @review.updated_at,
                 etag: @product.reviews.cache_key_with_version
    end
  end
end
