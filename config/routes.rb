Myapp::Application.routes.draw do

  resources :elections

  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'

  authenticated :user do
    root to: 'home#index'
  end
  root to: "home#index"

  devise_for :users
  resources :users, only: [:show, :index]
  resources :areas

end
