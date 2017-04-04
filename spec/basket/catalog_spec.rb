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
      expect(subject.products).to be_a Hash
    end
  end

  describe '[]' do
    subject { described_class.new }

    it 'retrieves products by code symbol' do
      expect(subject[:foo]).to be_a Hash
    end

    it 'retrieves products by code string' do
      expect(subject['foo']).to be_a Hash
    end

    it 'returns nil for unknown products' do
      expect(subject[:doh]).to be_nil
    end
  end
end
