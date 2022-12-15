Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:index, :show, :update, :destroy, :create] do
    resources :artworks, only: [:index]
    resources :artwork_shares, only: [:index]
  end
  
  resources :artworks, only: [:show, :update, :destroy, :create]
  resources :artwork_shares, only: [ :destroy, :create]
  # get 'users', to: 'users#index', as: 'users'
  # post 'users', to: 'users#create'
  # get 'users', to: 'users#new', as: 'new_user'
  # get 'users', to: 'users#edit', as: 'edit_user'
  # get 'users/:id', to: 'users#show', as: 'user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'



end
