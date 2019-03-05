require 'rails_helper'

describe  OrdersController, type: :controller do
  #should only be able to see orders if you're logged in
  let(:user) { User.create!(first_name: "Sandy", last_name: "Khan", email: "sandy@email.com", password: "password") }
  let(:order) { Order.new(product: product, total: 1000.00)}

  describe 'GET #index' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end
      it 'loads all order details' do
        get :index
        expect(response).to be_ok
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login page' do
        get :index
        expect(flash[:alert]).not_to be nil
        expect(response).to redirect_to(new_user_session_path)
      end
    end

  end
end
