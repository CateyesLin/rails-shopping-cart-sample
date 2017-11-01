Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  resources :users do
    resources :receivers do
      resources :orders
    end
  end

  resources :orders, only: [:index, :show, :edit, :update, :destroy]
  resources :products
  resources :order_products

end
