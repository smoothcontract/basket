module Basket
  class Offer
    attr_reader :code, :product, :type

    def initialize(code:, product:, type:)
      @code = code.to_sym
      @product = product.to_sym
      @type = type
    end

    def discount(products)
      build_discount.discount(products)
    end

    private

    def build_discount
      @discount ||= Discounts.const_get(@type).new(@product)
    end
  end
end
