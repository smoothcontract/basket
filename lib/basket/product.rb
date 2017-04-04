module Basket
  # Simple PORO to store details of a single product
  class Product
    attr_reader :code, :price, :name

    def initialize(code:, price:, name:)
      @code = code.to_sym
      @name = name
      @price = price.to_f
    end
  end
end
