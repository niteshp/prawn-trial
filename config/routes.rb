Rails.application.routes.draw do
  root 'reports#index'

  resources :orders
  resources :reports
end