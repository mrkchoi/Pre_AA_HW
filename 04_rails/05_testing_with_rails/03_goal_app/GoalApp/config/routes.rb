Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :comments
    resources :goals do
      resources :comments
    end
  end
  resources :sessions
  
end
