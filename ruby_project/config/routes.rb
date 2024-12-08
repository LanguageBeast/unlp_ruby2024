Rails.application.routes.draw do
  root "pages#home"
  resources :users
  devise_for :users, skip: :all
  devise_scope :user do
    get "login", to: "sessions#new", as: :new_user_session
    post "login", to: "sessions#create", as: :user_session
    delete "logout", to: "sessions#destroy", as: :destroy_user_session
  end
  resources :productos
  resources :sales, except: [:edit, :update]

  match "/users/*", to: "application#not_found", via: :all

  # get "up" => "rails/health#show", as: :rails_health_check

end
