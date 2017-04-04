require 'spec_helper'

describe Basket::Catalog do
  let(:yaml) do
    <<-YAML
    foo:
      name: Stuff
      price: 0.99
    bar:
      name: Things
      price: 9.99
    YAML
  end

  before do
    allow(File).to receive(:read) { yaml }
  end

  describe '.initialize' do
    subject { described_class.new }

    it 'loads YAML file' do
      expect(subject.products).to be_an Array
    end
  end

  describe '#[]' do
    subject { described_class.new }

    it 'retrieves products by code symbol' do
      expect(subject[:foo]).to be_a Basket::Product
    end

    it 'retrieves products by code string' do
      expect(subject['foo']).to be_a Basket::Product
    end

    it 'has correct product code' do
      expect(subject[:foo].code).to eq :foo
    end

    it 'has correct product name' do
      expect(subject[:foo].name).to eq 'Stuff'
    end

    it 'has correct product price' do
      expect(subject[:bar].price).to eq 9.99
    end

    it 'returns nil for unknown products' do
      expect(subject[:doh]).to be_nil
    end
  end
end
