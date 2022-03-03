Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/user/:id', to: 'users#show', as: :show

  resources :items
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  match "/loans/:id/mark", to: "loans#mark", via: [:patch, :get], as: :loan_mark
  resources :loans do
    resources :reviews, only: [:new, :create]
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :reviews, only: [:show, :delete]
end
