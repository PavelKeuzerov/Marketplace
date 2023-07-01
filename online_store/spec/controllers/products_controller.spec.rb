require 'rails_helper'

describe ProductsController, type: :controller do
  describe 'GET #index' do
    let(:product) { create :product }

    subject { get :show, params: { id: product.id } }

    context 'show product' do
      it 'render show view' do
        is_expected.to render_template :show
      end
    end
  end

  # describe 'POST #create' do
  #   let(:product) { { name: 'New product' } }

  #   subject { get :show, params: { id: product.id } }

  #   context 'product save' do
  #     it 'redirects to product path' do
  #       # post products_path, params: { folder: valid_params }

  #       expect(response).to have_http_status(302)
  #       expect(response.location).to eq(new_user_session_url)
  #     end
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   let(:product) { create :product }
  #   let(:user) { create :user }

  #   subject { delete :destroy, params: { id: product.id } }

  #   context 'delete product' do
  #     it 'product delete' do
  #       # sign_in(user)
  #       # expect { products_path }.to change(user.products, :count).by(-1)
  #       # expect { products_path }.to change(user.products)
  #       expect { subject }.to change { user.reload.products.present? }.to(false)
  #       # expect { subject }.to change { product.present? }.to(false)
  #       expect(response).to have_http_status(:ok)
  #     end

  #     it 'redirects to the index page' do
  #       # delete product_path(product)
  #       expect(response).to have_http_status(302)
  #       expect(response.location).to eq(products_path)
  #     end
  #   end
  # end
end
