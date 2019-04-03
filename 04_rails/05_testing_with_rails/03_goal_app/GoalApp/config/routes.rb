Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :goals
    resources :user_comments
  end
  resources :sessions
  resources :user_comments
end
