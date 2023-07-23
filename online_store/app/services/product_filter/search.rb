module ProductFilter
  class Search
    class << self
      def call(params)
        @q = Product.ransack(params[:q])
        @products = @q.result(distinct: true)

        [@q, @products]
      end
    end
  end
end
