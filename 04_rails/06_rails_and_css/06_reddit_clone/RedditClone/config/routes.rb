Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create, :new, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :subs
  resources :posts do
    resources :comments, only: [:new]
  end
  resources :comments do
    resources :comments, only: [:new, :create]
  end
end
