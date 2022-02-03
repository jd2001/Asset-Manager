Rails.application.routes.draw do
  root 'business_assets#index'

  resources :accesses
  resources :admins
  resources :business_assets
  resources :companies
  resources :employees
  resources :host_types
  resources :info_types
  resources :priorities

  devise_for :users
end
