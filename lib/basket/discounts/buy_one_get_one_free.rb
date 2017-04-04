module Basket
  module Discounts
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
