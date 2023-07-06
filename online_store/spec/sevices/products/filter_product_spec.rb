# frozen_string_literal: true

require 'rails_helper'

describe Products::FilterProduct do
  describe '.call' do
    subject(:filter_product) { described_class.call }

    let(:product1) do
      Product.create!(name: 'cup', price: 6, location: 'Gomel', product_detail: 'ceramic', availability: 'in stock')
    end
    let(:product2) do
      Product.create!(name: 'fork', price: 9, location: 'Gomel', product_detail: 'metal', availability: 'in stock')
    end
    let(:product3) do
      Product.create!(name: 'spoon', price: 11, location: 'Minsk', product_detail: 'aaaa', availability: 'in stock')
    end

    let!(:product) { create :product }

    context 'when the price parameter' do
      let(:product_params) { { price: 8 } }

      it 'returns two product' do
        expect(filter_product).to eq([product1, product2])
      end
    end

    context 'when nothing is found' do
      let(:product_params) { { title: '7', location: 'Gomel' } }

      it 'returns nil' do
        expect(filter_product).to eq([])
      end
    end

    context 'when the location parameter' do
      let(:product_params) { { location: 'Gomel' } }

      it 'returns two product' do
        expect(filter_product).to eq([product1, product2])
      end
    end
  end
end
