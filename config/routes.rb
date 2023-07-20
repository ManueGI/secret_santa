Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'pages#home'

  resources :groups do
    resources :group_members
    resources :santa_assignements
  end

  get '/profile', to: 'pages#profile', as: :profile
end
