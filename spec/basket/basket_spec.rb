require 'spec_helper'

describe Basket::Basket do
  describe '.initialize' do
    subject { described_class.new }

    it 'loads product catalog' do
      expect(subject.catalog).to be_a Basket::Catalog
    end

    it 'loads delivery charges' do
      expect(subject.delivery).to be_a Basket::Delivery
    end

    it 'loads offers' do
      expect(subject.offers).to be_a Basket::Offers
    end

    it 'has empty content' do
      expect(subject.content).to be_empty
    end
  end

  describe 'integration test' do
    let(:basket) { described_class.new }
    subject { basket.total }

    it 'calculates total for socks and blouse' do
      basket.add(:s01)
      basket.add(:b01)
      expect(subject).to eq 37.85
    end

    it 'calculates total for two pairs of jeans' do
      basket.add(:j01)
      basket.add(:j01)
      expect(subject).to eq 54.37
    end

    it 'calculates total for jeans and a blouse' do
      basket.add(:j01)
      basket.add(:b01)
      expect(subject).to eq 60.85
    end

    it 'calculates total for lots of items' do
      basket.add(:s01, :s01, :j01, :j01, :j01)
      expect(subject).to eq 98.27
    end
  end
end
