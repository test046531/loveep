Rails.application.routes.draw do
  root "home#index"
  # root "posts#index"
  resources :posts, only: [:index, :new, :create]
  get 'question', to: 'pages#question'
  get 'mypage', to: 'users#mypage'
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  # root "articles#index"
end
