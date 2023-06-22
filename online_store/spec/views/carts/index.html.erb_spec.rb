require 'rails_helper'

RSpec.describe 'carts/index', type: :view do
  before(:each) do
    assign(:carts, [
             Cart.create!(
               user_id: ''
             ),
             Cart.create!(
               user_id: ''
             )
           ])
  end

  it 'renders a list of carts' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(''.to_s), count: 2
  end
end
