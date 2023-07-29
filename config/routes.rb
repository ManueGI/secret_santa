Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'pages#home'

  resources :groups do
    resources :group_members, only: %i[new create destroy]
    resources :santa_assignements, only: %i[new create]
  end

  get '/profile', to: 'pages#profile', as: :profile
  # delete 'group_member/:id/destroy', to: 'groupmembers#destroy', as: :destroy_group_member
end
