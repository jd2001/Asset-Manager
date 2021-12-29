Rails.application.routes.draw do
  root 'business_assets#index'

  resources :business_assets
  resources :host_types

  devise_for :users
end
