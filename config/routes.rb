Rails.application.routes.draw do
  root "home#index"
  get 'posts', to: 'home#posts'
  # root "posts#index"
  resources :users, only: [:create] do
    resources :posts
  end

  get 'question', to: 'pages#question'
  get 'mypage', to: 'users#mypage'
  get 'signup', to: 'users#new'
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  # root "articles#index"
end
