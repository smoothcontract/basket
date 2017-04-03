require 'yaml'

class Basket::Catalog
  attr_reader :products

  def initialize
    @products = YAML.load(File.read(filename))
  end

  def [](code)
    details = @products[code.to_s]
    details ? Basket::Product.new(details) : nil
  end

  private

  def filename
    File.join(Dir.getwd, 'config', 'products.yml')
  end
end
