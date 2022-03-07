Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # get '/user/:id', to: 'users#show', as: :show

  resources :users, only: :show

  resources :items
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  match "/loans/:id/mark", to: "loans#mark", via: [:patch, :get], as: :loan_mark
  get "/loans/borrow", to: "loans#new_borrow"
  post "/loans/borrow", to: "loans#borrow"
  get "/loans/lenders", to: "loans#lenders"
  get "/loans/borrowers", to: "loans#borrowers"
  resources :loans do
    resources :reviews, only: [:new, :create]
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  resources :reviews, only: [:show, :delete,]
end
