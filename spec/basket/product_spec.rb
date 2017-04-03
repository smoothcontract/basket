require 'spec_helper'

describe Basket::Product do
  describe '.initialize' do
    subject { described_class.new(product_code) }

    context 'Jeans' do
      let(:product_code) { :j01 }

      it 'populates name' do
        expect(subject.code).to eq :j01
      end

      it 'populates code' do
        expect(subject.name).to eq 'Jeans'
      end

      it 'populates price' do
        expect(subject.price).to eq 32.95
      end
    end

    context 'Blouse' do
      let(:product_code) { :b01 }

      it 'populates name' do
        expect(subject.code).to eq :b01
      end

      it 'populates code' do
        expect(subject.name).to eq 'Blouse'
      end

      it 'populates price' do
        expect(subject.price).to eq 24.95
      end
    end

    context 'Socks' do
      let(:product_code) { :s01 }

      it 'populates name' do
        expect(subject.code).to eq :s01
      end

      it 'populates code' do
        expect(subject.name).to eq 'Socks'
      end

      it 'populates price' do
        expect(subject.price).to eq 7.95
      end
    end
  end
end
