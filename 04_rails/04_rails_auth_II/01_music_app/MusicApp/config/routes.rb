Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resource :session
  resources :albums, only: [:create, :edit, :show, :update, :destroy]
  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums do
    resources :tracks, only: [:new]
  end

  resources :tracks, only: [:create, :edit, :show, :update, :destroy]

end
