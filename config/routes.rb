Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :items
  resources :pages, only: :dashboard
  resources :loans do
    resources :reviews, only: [:new, :create]
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :reviews, only: [:show, :delete]
end
