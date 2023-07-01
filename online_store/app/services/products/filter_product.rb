module Products
  class FilterProduct
    class << self
      def call
        product = Product.all
        product.where('price >= 1 AND price <10')
               .where(location: 'Gomel')
      end
    end
  end
end
