module Basket
  class Product
    attr_reader :code, :price, :name

    def initialize(code)
      product = self.class.catalog[code]
      raise Basket::InvalidProduct unless product

      @code = code
      @name = product['name']
      @price = product['price']
    end

    def self.catalog
      @@catalog ||= Basket::Catalog.new
    end
  end
end
