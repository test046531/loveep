Rails.application.routes.draw do
  root "home#index"
  get 'posts', to: 'home#posts'
  # root "posts#index"
  resources :users do
    resources :posts
  end
  get 'question', to: 'pages#question'
  get 'mypage', to: 'users#mypage'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
