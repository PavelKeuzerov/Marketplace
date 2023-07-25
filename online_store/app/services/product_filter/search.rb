module ProductFilter
  class Search
    class << self
      def call(params)
        @filter = Product.ransack(params[:q])
        @products = @filter.result(distinct: true)

        [@filter, @products]
      end
    end
  end
end
