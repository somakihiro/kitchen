Rails.application.routes.draw do
  root 'recipes#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :recipes
  resources :users do
    member do
      get 'followings'
      get 'followers'
      get 'timeline'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  
end
