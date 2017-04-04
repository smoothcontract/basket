require 'yaml'

module Basket
  class Catalog
    attr_reader :products

    def initialize
      @products = parse_catalog
    end

    def [](code)
      @products.find {|product| product.code == code.to_sym }
    end

    private

    def parse_catalog
      products = YAML.load(File.read(filename))

      products.map do |product_attrs|
        Product.new(
          code: product_attrs.first,
          name: product_attrs.last['name'],
          price: product_attrs.last['price']
        )
      end
    end

    def filename
      File.join(Dir.getwd, 'config', 'products.yml')
    end
  end
end
