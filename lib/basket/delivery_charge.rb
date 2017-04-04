module Basket
  class DeliveryCharge
    attr_reader :name, :minimum, :cost

    def initialize(name:, minimum:, cost:)
      @name = name
      @minimum = minimum.to_f
      @cost = cost.to_f
    end
  end
end
