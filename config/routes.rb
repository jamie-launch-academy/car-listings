Rails.application.routes.draw do
  root 'homes#index'

  resources :manufacturers
  resources :cars
end
