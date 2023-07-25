# frozen_string_literal: true

require 'rails_helper'

describe ProductFilter::Search do
  describe '.call' do
    subject(:params) { described_class.call(params) }

    let(:product1) do
      Product.create!(name: 'cup', price: 6, location: 'Gomel', product_detail: 'ceramic', availability: 'in stock')
    end
    let(:product2) do
      Product.create!(name: 'fork', price: 9, location: 'Gomel', product_detail: 'metal', availability: 'in stock')
    end
    let(:product3) do
      Product.create!(name: 'spoon', price: 11, location: 'Minsk', product_detail: 'aaaa', availability: 'in stock')
    end

    # let!(:product) { create :product }

    # context 'when the price parameter' do
    #   # binding.pry
    #   let(:product_params) { { name: 'cu' } }

    #   it 'returns two product' do
    #     expect(params).to eq([product1])
    #   end
    # end

    # context 'when nothing is found' do
    #   let(:params) { { name: 'cup' } }

    #   it 'returns nil' do
    #     expect(params).to eq([product1])
    #   end
    # end

    # context 'when the location parameter' do
    #   let(:arams) { { location: 'Gomel' } }

    #   it 'returns two product' do
    #     expect(params).to eq([product1, product2])
    #   end
    # end
  end
end
