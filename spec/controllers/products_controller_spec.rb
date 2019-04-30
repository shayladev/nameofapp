require 'rails_helper'

describe  ProductsController, type: :controller do

  let(:user)  { FactoryBot.create(:user, admin: true) }
  let(:product)  { FactoryBot.create(:product) }
  let(:comment)  { FactoryBot.build(:comment, rating: 3, user: user ) }

  describe 'GET #index' do
      context 'no search term' do
          it 'loads all products' do
              get :index
              expect(response).to be_ok
          end
      end
  end

  describe 'GET #show' do
      context 'calling for a particular product' do

          it "loads correct product" do
              get :show, params: { id: product.id }
              expect(assigns(:product)).to eq product
              expect(response).to be_ok
              expect(response).to render_template('show')
          end
      end
  end



  describe 'GET #new' do
        context 'calling for new product form when signed in' do
            before do
              sign_in user
            end

            it "loads new form" do
              get :new
              expect(response).to be_ok
            end
        end

        context 'calling for new product form when not signed in' do

            it "does not load new form" do
              get :new
              expect(response).to redirect_to(new_user_session_path)
            end
        end
  end

  describe 'GET #edit' do
        context 'calling the edit function on a  product when signed in' do

            before do
                sign_in user
            end

            it "loads product form" do
                get :edit, params: { id: product.id }
                expect(assigns(:product)).to eq product
            end
        end


        context 'calling the edit function on a  product name when not signed in' do

            it "redirects to login page " do
                get :edit, params: { id: product.id }
                expect(response).to redirect_to(new_user_session_path)
            end
        end
  end



  describe 'POST #create' do

        context 'when saving a new product' do

            it 'displays a successful notice' do
                post :create, params: {product: product}
                expect(flash[:alert]).not_to be nil
            end

        end

  end

  describe 'PUT #update' do

        context 'when updating a product when signed in' do

            before do
              sign_in user
            end

            it 'updates product' do
              put :update, params: { id: product.id, product: {name: "new name"} }
              expect(assigns(:product)).to eq Product.last
              product.reload
              expect(product.name).to eq("new name")
            end
          end

  end

  describe 'PUT #destroy' do

      context 'when deleting a product when signed in' do

          before do
            sign_in user
          end

          it 'deletes product' do
              delete :destroy, params: { id: product.id}
              expect(assigns(:product)).to eq product
              expect(response).to redirect_to root_path
          end
      end
  end


end
