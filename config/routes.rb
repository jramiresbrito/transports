Rails.application.routes.draw do
  resources :vehicles
  resources :routes
  resources :maintenances
  resources :fuel_tanks
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
