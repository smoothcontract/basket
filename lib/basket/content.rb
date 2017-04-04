module Basket
  class Content
    #TODO maybe this should be instantiated with a product catalog?
    def initialize
      @items = []
    end

    def add_items(*items)
    end

    def total_price
      0.0
    end
  end
end
