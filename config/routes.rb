Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :items, only: %i[new create edit update delete]
  resources :pages, only: :dashboard
  resources :loans do
    resources :reviews, only: [:new, :create]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :reviews, only: [:show, :delete]
end
