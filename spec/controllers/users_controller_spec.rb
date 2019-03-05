require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { User.create!(first_name: "Sandy", last_name: "Khan", email: "sandy@email.com", password: "password") }
  let(:otheruser) { User.create!(first_name: "Santa", last_name: "Claus", email: "santa@email.com", password: "password") }

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end
      it 'loads correct user details' do
        get :show, params: {id: user.id}
        expect(response).to be_ok
        expect(assigns(:user)).to eq user
      end
      it 'cannot access other user show page' do
        get :show, params: {id: otheruser.id}
        expect(response).not_to be_ok
        expect(flash[:alert]).not_to be nil
        expect(response).to redirect_to(root_path)
      end

    end

    context 'when a user is not logged in' do
      it 'redirects to landing page' do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end


end
