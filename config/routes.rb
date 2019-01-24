Rails.application.routes.draw do
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/about'
  get 'simple_pages/contact'
  root 'products#index'
  get 'simple_pages/index'
  get 'products/index'
  get 'orders/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
