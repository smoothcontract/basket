require 'yaml'

module Basket
  # Load delivery charges from YAML file
  class Delivery
    attr_reader :charges

    def initialize
      @charges = parse_charges
    end

    def cost(order_value)
      lowest_charge = @charges.find { |charge| charge.cost if order_value >= charge.minimum }
      raise InvalidDeliveryCharge unless lowest_charge

      lowest_charge.cost
    end

    private

    def parse_charges
      charges = YAML.safe_load(File.read(filename))

      charges.map do |charge_attrs|
        DeliveryCharge.new(
          name: charge_attrs.first,
          minimum: charge_attrs.last['minimum'],
          cost: charge_attrs.last['cost']
        )
      end
    end

    def filename
      File.join(Dir.getwd, 'config', 'delivery.yml')
    end
  end
end
