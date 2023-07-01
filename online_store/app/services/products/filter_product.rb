module Products
  class FilterProduct
    class << self
      def call
        Product.where('price >= 1 AND price <10').where(location: 'Gomel')
      end
    end
  end
end
