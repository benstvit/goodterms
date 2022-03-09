Rails.application.routes.draw do
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_error", via: :all
  get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # get '/user/:id', to: 'users#show', as: :show

  resources :users, only: :show

  resources :items
  get "/dashboard", to: "pages#dashboard", as: :dashboard
  # patch '/loans/:id', to: 'loans#mark'
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
