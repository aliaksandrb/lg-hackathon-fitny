Rails.application.routes.draw do
  resources :guides

  resources :categories

  root to: 'visitors#index'
  devise_for :users
end
