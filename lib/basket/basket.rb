module Basket
  # Coordinate basket items with product catalog, delivery charges and discounts
  class Basket
    attr_reader :catalog, :delivery, :offers, :content

    def initialize
      @catalog = Catalog.new
      @delivery = Delivery.new
      @offers = Offers.new
      @content = Content.new(@catalog)
    end

    def add(*product_codes)
      @content.add_items(*product_codes)
    end

    def total
      sub_total = @content.total_price - @offers.discount(@content.items)
      (sub_total + @delivery.cost(sub_total)).round(2)
    end
  end
end
