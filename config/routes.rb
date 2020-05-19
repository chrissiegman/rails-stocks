Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login', to: 'sessions#new'
  post 'sessions/login', to: 'sessions#create'
  get 'sessions/welcome'
  get 'users/new'
  get 'users/create'
  get 'welcome/index', to: 'sessions#welcome'

  resources :users, only: [:new, :create]

  resources :articles do
    resources :comments
  end

  resources :tickers do
    resources :prices
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
