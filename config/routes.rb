Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'products#index'

  mount API::Base => '/api'

  devise_for :users
  resources :users do
    resources :receivers
  end

  resources :orders do
    member do
      patch  'delivery'
      delete 'cancel'
    end
  end
  resources :products

  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end

end
