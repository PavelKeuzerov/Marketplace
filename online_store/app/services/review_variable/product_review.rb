module ReviewVariable
  class ProductReview
    class << self
      def call(params)
        @product = Product.find(params[:id])
        @review ||= @product.reviews.build
        @reviews = @product.reviews.order created_at: :desc

        [@product, @review, @reviews]
      end
    end
  end
end
