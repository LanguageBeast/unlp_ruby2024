Rails.application.routes.draw do
  resources :sales, except: [:edit, :update]
  root "pages#home"
  resources :productos

  # get "up" => "rails/health#show", as: :rails_health_check

end
