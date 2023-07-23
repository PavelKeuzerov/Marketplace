require 'rails_helper'

describe ProductsController, type: :controller do
  describe 'GET #index' do
    let(:product) { create :product }

    subject { get :show, params: { id: product.id } }

    context 'show product' do
      it 'render show view' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST #create' do
    let(:user) { create :user }
    let(:product) { create :product, user: }

    subject { post :create, params: { id: product.id } }

    context 'with valid attributes' do
      it 'saves product' do
        expect { subject }.to change(user.products, :count).by(+1)
      end

      it 'render show view' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid attributes' do
      subject { post :create, params: { id: nil } }

      it 'does not save product' do
        expect { subject }.to_not change(user.products, :count)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:user) { create :user }
    let!(:product) { create :product, user: }

    subject { delete :destroy, params: { id: product.id } }

    context 'delete product' do
      # it 'product delete' do
      #   # binding.pry
      #   expect { subject }.to change(user.products, :count).by(-1)
      # end

      it 'render show view' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'PATCH #update' do
    let(:user) { create :user }
    let(:product) { create :product, user: }

    subject { patch :update, params: { id: product.id } }

    context 'with valid attributes' do
      it 'update product' do
        expect { subject }.to change(user.products, :count)
      end

      it 'render show view' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid attributes' do
      subject { patch :update, params: { id: nil } }

      # it 'does not update product' do
      #   expect { subject }.to change(user, :products)
      # end

      it 'render show view' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
