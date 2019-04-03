Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    resources :goals do 
      resources :goal_comments
    end
    resources :user_comments
  end
  resources :sessions
  resources :user_comments
  resource :goal_comments
end
