require 'spec_helper'

describe Basket::Content do
  let(:catalog) { Basket::Catalog.new }
  let(:content) { described_class.new(catalog) }

  describe '.initialize' do
    it 'sets empty list of items' do
      expect(content.items).to be_empty
    end
  end

  describe '#add_item' do
    subject { content.items }

    it 'adds an item' do
      content.add_item(:s01)
      expect(subject.count).to eq 1
    end

    it 'fetches product from catalog' do
      content.add_item(:s01)
      expect(subject.first).to be_a Basket::Product
    end

    it 'raises exception for unknown product code' do
      expect { content.add_item(:foo) }.to raise_error(Basket::InvalidProduct)
    end
  end

  describe '#add_items' do
    subject { content.items }

    it 'adds a single item' do
      content.add_items(:s01)
      expect(subject.count).to eq 1
    end

    it 'adds multiple items' do
      content.add_items(:s01, :b01)
      expect(subject.count).to eq 2
    end
  end

  describe '#total_price' do
    subject { content.total_price }

    it 'returns total price when empty' do
      expect(subject).to eq 0.0
    end

    it 'returns total price with items' do
      content.add_items(:s01, :b01)
      expect(subject).to be > 0.0
    end
  end
end
