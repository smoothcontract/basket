require 'yaml'

module Basket
  # Load offer details from YAML file
  class Offers
    attr_reader :offers

    def initialize
      @offers = parse_offers
    end

    def discount(products)
      @offers.sum { |offer| offer.discount(products) }.round(2)
    end

    private

    def parse_offers
      offers = YAML.safe_load(File.read(filename))

      offers.map do |offer_attrs|
        Offer.new(
          code: offer_attrs.first,
          product: offer_attrs.last['product_code'],
          type: offer_attrs.last['offer_type']
        )
      end
    end

    def filename
      File.join(Dir.getwd, 'config', 'offers.yml')
    end
  end
end
