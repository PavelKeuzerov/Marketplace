require 'rails_helper'

RSpec.describe 'products/edit', type: :view do
  let(:product) do
    Product.create!(
      name: 'MyString',
      category: 'MyString',
      product_detail: 'MyString',
      price: '9.99',
      location: 'MyString',
      availability: 'MyString',
      user_id: ''
    )
  end

  before(:each) do
    assign(:product, product)
  end

  it 'renders the edit product form' do
    render

    assert_select 'form[action=?][method=?]', product_path(product), 'post' do
      assert_select 'input[name=?]', 'product[name]'

      assert_select 'input[name=?]', 'product[category]'

      assert_select 'input[name=?]', 'product[product_detail]'

      assert_select 'input[name=?]', 'product[price]'

      assert_select 'input[name=?]', 'product[location]'

      assert_select 'input[name=?]', 'product[availability]'

      assert_select 'input[name=?]', 'product[user_id]'
    end
  end
end
