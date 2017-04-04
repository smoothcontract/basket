module Basket
  class Content
    attr_reader :items

    def initialize(catalog)
      @catalog = catalog
      @items = []
    end

    def add_items(*item_codes)
      item_codes = [item_codes] unless item_codes.is_a? Array
      item_codes.each {|item_code| add_item(item_code) }
    end

    def add_item(item_code)
      product = @catalog[item_code]
      raise InvalidProduct unless product
      @items << product
    end

    def total_price
      @items.sum(&:price).round(2)
    end
  end
end
