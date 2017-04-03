require 'spec_helper'

describe Basket::Content do
  describe '.initialize' do
    subject { described_class.new }

    it 'sets empty list of items' do
      expect(subject.items).to be_empty
    end
  end

  describe '#add_items' do
    let(:basket) { described_class.new }

    it 'raises an exception when adding an unknown item'
    it 'adds the same item multiple times'
  end

  describe '#total_price' do
    let(:basket) { described_class.new }

    subject { basket.total_price }

    it 'returns total price when empty' do
      expect(subject).to eq 0.0
    end
      
    it 'returns total for socks and blouse' do
      basket.add_items(:s01, :b01)
      expect(subject).to eq 37.85
    end

    it 'returns total for two pairs of jeans' do
      basket.add_items(:j01, :j01)
      expect(subject).to eq 54.37
    end

    it 'returns total for jeans and a blouse' do
      basket.add_items(:j01, :b01)
      expect(subject).to eq 60.85
    end

    it 'returns total for lots of items' do
      basket.add_items(:s01, :s01, :j01, :j01, :j01)
      expect(subject).to eq 98.27
    end
  end
end
