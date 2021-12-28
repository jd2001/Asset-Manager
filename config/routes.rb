Rails.application.routes.draw do
  root 'asset#index'

  resource :assets

  devise_for :users
end
