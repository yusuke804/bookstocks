Rails.application.routes.draw do
  root to: "toppages#index"
  
  get "signup", to: "users#new"
  resources :users, only: [:show, :new, :create, :edit, :update] do 
    member do
      get :likes
    end
  end
  
  namespace :admin do
    resources :users, only: [:index, :destroy]
  end
  
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  resources :posts do 
    member do 
      get :tagged
    end
    collection do
      get :searched 
      get :searched_result
    end
  end
  
  resources :favorites, only: [:create, :destroy]
end