module ReviewVariable
  class ReviewCreate
    class << self
      def call(params, review_params)
        @product = Product.find params[:product_id]
        @review = @product.reviews.build(review_params)

        [@product, @review]
      end
    end
  end
end
