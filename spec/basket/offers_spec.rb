require 'spec_helper'

describe Basket::Offers do
  let(:yaml) do
    <<-YAML
    foo:
      product_code: a01
      offer_type: BuyOneGetOneFree
    bar:
      product_code: b01
      offer_type: BuyOneGetOneHalfPrice
    YAML
  end

  before do
    allow(File).to receive(:read) { yaml }
  end

  describe '.initialize' do
    subject { described_class.new }

    it 'loads YAML file' do
      expect(subject.offers).to be_an Array
    end
  end

  describe '#discount' do
    let(:offers) { described_class.new }
    let(:bogof_product) { Basket::Product.new(code: :a01, price: 2.00, name: 'Foo') }
    let(:bogoh_product) { Basket::Product.new(code: :b01, price: 3.00, name: 'Bar') }
    let(:other_product) { Basket::Product.new(code: :xxx, price: 1.00, name: 'Doh') }

    subject { offers.discount(products) }

    # TODO: can probably move some of these to individual unit tests of the discount classes

    context 'for non discounted products' do
      let(:products) { [other_product, other_product] }

      it 'has zero discount' do
        expect(subject).to eq 0.0
      end
    end

    context 'for one half price product' do
      let(:products) { [bogoh_product] }

      it 'has zero discount' do
        expect(subject).to eq 0.0
      end
    end

    context 'for one bogof product' do
      let(:products) { [bogof_product] }

      it 'has zero discount' do
        expect(subject).to eq 0.0
      end
    end

    context 'for two half price products' do
      let(:products) { [bogoh_product, bogoh_product] }

      it 'discounts half the price of one product' do
        expect(subject).to eq 1.50
      end
    end

    context 'for two bogof products' do
      let(:products) { [bogof_product, bogof_product] }

      it 'discounts full price of one product' do
        expect(subject).to eq 2.00
      end
    end

    context 'for three half price products' do
      let(:products) { [bogoh_product, bogoh_product, bogoh_product] }

      it 'discounts half the price of one product' do
        expect(subject).to eq 1.50
      end
    end

    context 'for three bogof products' do
      let(:products) { [bogof_product, bogof_product, bogof_product] }

      it 'discounts full price of one product' do
        expect(subject).to eq 2.00
      end
    end
  end
end
