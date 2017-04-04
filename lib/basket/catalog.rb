require 'yaml'

module Basket
  class Catalog
    attr_reader :products

    def initialize
      @products = YAML.load(File.read(filename))
    end

    def [](code)
      @products[code.to_s]
    end

    private

    def filename
      File.join(Dir.getwd, 'config', 'products.yml')
    end
  end
end
