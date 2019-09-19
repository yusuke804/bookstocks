Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "signup", to: "users#new"
  resources :users, only: [:show, :new, :create, :edit, :update] do 
    member do
      get :likes
    end
  end
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :posts do 
    member do 
      get :tagged
    end
  end
  resources :favorites, only: [:create, :destroy]
  resources :searches, only: [:create]
end
