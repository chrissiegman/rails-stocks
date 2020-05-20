Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'tickers#index'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'signup', to: 'users#new'

  resources :users, only: [:new, :create]

  resources :articles do
    resources :comments
  end

  resources :tickers do
    resources :prices
  end

  root 'tickers#index'
  #root 'sessions#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
