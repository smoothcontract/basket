module Basket
  module Discounts
    # Half of the eligible products are fully discounted
    class BuyOneGetOneFree < Base
      private

      def calculate
        @matches.count / 2 * full_product_price
      end

      def full_product_price
        @matches.first.price
      end
    end
  end
end
