Rails.application.routes.draw do
  root 'business_assets#index'

  resources :business_assets
  resources :host_types
  resources :info_types
  resources :admins
  resources :priorities

  devise_for :users
end
