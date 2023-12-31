Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:create, :update, :destroy] do
    resources :categories, only: [:index, :create, :update, :destroy]
    resources :expenses, only: [:index, :create, :update, :destroy] 
  end
  post '/login', to: 'users#login'
end
