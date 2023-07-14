module ProductFilter
  class Search
    class << self
      def call(params)
        @product = Product.where('name LIKE ?', "%#{params[:query]}%")
      end
    end
  end
end

