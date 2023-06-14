require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    assign(:product, Product.create!(
      name: "Name",
      category: "Category",
      product_detail: "Product Detail",
      price: "9.99",
      location: "Location",
      availability: "Availability",
      user_id: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Product Detail/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Availability/)
    expect(rendered).to match(//)
  end
end
