Rails.application.routes.draw do
  resources :users do
    resources :posts
  end

  get 'question', to: 'pages#question'
  get 'mypage', to: 'users#mypage'
  get 'posts', to: 'posts#all'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
