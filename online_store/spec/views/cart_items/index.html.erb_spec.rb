require 'rails_helper'

RSpec.describe 'cart_items/index', type: :view do
  before(:each) do
    assign(:cart_items, [
             CartItem.create!(
               product_id: '',
               cart_id: '',
               quantity: ''
             ),
             CartItem.create!(
               product_id: '',
               cart_id: '',
               quantity: ''
             )
           ])
  end

  it 'renders a list of cart_items' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
  end
end
