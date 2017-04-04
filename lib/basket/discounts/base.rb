module Basket
  module Discounts
    # Parent class for common discount behaviour. Must be subclassed to implement calculation.
    class Base
      attr_reader :product_code

      def initialize(product_code)
        @product_code = product_code
      end

      def discount(products)
        @matches = eligible_products(products)
        return 0.0 if @matches.empty?

        calculate.round(2)
      end

      private

      def eligible_products(products)
        products.select { |product| product.code == @product_code }
      end

      def calculate
        raise NotImplementedError, 'Must be implemented in a subclass'
      end
    end
  end
end
