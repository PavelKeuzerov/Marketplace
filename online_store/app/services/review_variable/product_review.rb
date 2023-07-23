module ReviewVariable
  class ProductReview
    class << self
      def call(params)
        @product = Product.find(params[:id])
        # return unless stale?(@product)

        # fresh_when last_modified: @product.created_at.utc, etag: @product
        @review ||= @product.reviews.build
        @reviews = @product.reviews.order created_at: :desc
        # fresh_when last_modified: @review.updated_at,
        #  etag: @product.reviews.cache_key_with_version

        [@product, @review, @reviews]
      end
    end
  end
end
