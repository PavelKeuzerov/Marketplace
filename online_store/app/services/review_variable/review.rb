module ReviewVariable
  class Review
    class << self
      def call(params)
        @product = Product.find params[:product_id]
        @review = @product.reviews.find params[:id]

        [@product, @review]
      end
    end
  end
end
