require 'spec_helper'

describe Basket::Delivery do
  let(:yaml) do
    <<-YAML
    foo:
      minimum: 10.0
      cost: 1.00
    bar:
      minimum: 0.0
      cost: 2.00
    YAML
  end

  before do
    allow(File).to receive(:read) { yaml }
  end

  describe '.initialize' do
    subject { described_class.new }

    it 'loads YAML file' do
      expect(subject.charges).to be_an Array
    end
  end

  describe '#cost' do
    subject { described_class.new }

    it 'calculates lowest delivery charge' do
      expect(subject.cost(20.0)).to eq 1.00
      expect(subject.cost(10.0)).to eq 1.00
      expect(subject.cost(9.99)).to eq 2.00
      expect(subject.cost(0.00)).to eq 2.00
    end

    it 'raises exception if no delivery charge found' do
      expect { subject.cost(-9.99) }.to raise_error(Basket::InvalidDeliveryCharge)
    end
  end
end
