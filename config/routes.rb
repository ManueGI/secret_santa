Rails.application.routes.draw do
  devise_for :users

  # Defines the root path route ("/")
  root to: 'pages#home'

  resources :groups do
    resources :group_members, only: %i[new create destroy]
    resources :santa_assignements, only: %i[new create]
  end

  get '/profile', to: 'pages#profile', as: :profile

  resources :public_pages, only: %i[show]

end
