Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # resources :users

  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show', as: 'user'
  post 'users', to: 'users#create'
  get 'users/new(.:format)', to: 'users#new', as: 'new_user'
  get 'users/:id/edit(.:format)', to: 'users#edit', as: 'edit_user'
  patch 'users/:id(.:format)', to: 'users#update'
  put 'users/:id(.:format)', to: 'users#update'
  delete 'users/:id(.:format)', to: 'users#destroy'

  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :artworks, only: :index
  end
  resources :artworks, only: [:show, :create, :update, :destroy]
  resources :artworkshares, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy]

  # patch
  # delete
end
