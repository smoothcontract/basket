module Basket
  module Discounts
    # Half of the eligible products are discounted 50%
    class BuyOneGetOneHalfPrice < Base
      private

      def calculate
        @matches.count / 2 * half_product_price
      end

      def half_product_price
        @matches.first.price / 2.0
      end
    end
  end
end
