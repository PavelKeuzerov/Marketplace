require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    assign(:products, [
             Product.create!(
               name: 'Name',
               category: 'Category',
               product_detail: 'Product Detail',
               price: '9.99',
               location: 'Location',
               availability: 'Availability',
               user_id: ''
             ),
             Product.create!(
               name: 'Name',
               category: 'Category',
               product_detail: 'Product Detail',
               price: '9.99',
               location: 'Location',
               availability: 'Availability',
               user_id: ''
             )
           ])
  end

  it 'renders a list of products' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Category'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Product Detail'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Location'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Availability'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
  end
end
