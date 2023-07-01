module Products
  class FilterProduct
    class << self
      def call
        product = Product.all
        product.where('price >= 1 AND price <10')
               .where(location: 'Gomel')
        # product = product.where('year_published BETWEEN 1940 AND 1950', product_params[:year_published])
        # product = product.where('title LIKE ?', "%#{product_params[:title]}%") if product_params[:title]
      end
    end
  end
end
