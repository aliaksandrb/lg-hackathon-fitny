Rails.application.routes.draw do
  resources :steps
  resources :layout_types
  resources :guides
  resources :categories

  root to: 'guides#index'
  devise_for :users
end
