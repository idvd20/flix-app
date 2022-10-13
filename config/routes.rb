Rails.application.routes.draw do
  resources :favorites
  
  root "movies#index"
  
  resources :movies do
    resources :reviews
  end
  
  resources :users

  resource :session, only: [:new, :create, :destroy]

  get "signup" => "users#new"
  get "signin" => "sessions#new"
end
