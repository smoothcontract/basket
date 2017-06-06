module Basket
  class Basket
    attr_reader :catalog, 
    :delivery,
           :offers, :content

  def initialize
    @catalog = Catalog.new
    @delivery = Delivery.new
    @offers = Offers.new
    @content = Content.new(@catalog)
  end

    def add(*product_codes)
      begin
        @content.add_items(*product_codes)
      end
    end

    def total

      sub_total = @content.total_price - @offers.discount(@content.items)
      return (sub_total + @delivery.cost(sub_total)).round(2)

    end
  end
end
