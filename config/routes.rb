Rails.application.routes.draw do
  resources :locations

  get "up" => "rails/health#show", as: :rails_health_check

  root "locations#index"
end
