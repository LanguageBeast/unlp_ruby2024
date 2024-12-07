Rails.application.routes.draw do
  root "pages#home"
  resources :productos
  resources :sales, except: [:edit, :update]

  # get "up" => "rails/health#show", as: :rails_health_check

end
