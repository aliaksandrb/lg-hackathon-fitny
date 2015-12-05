Rails.application.routes.draw do
  resources :layout_types
  resources :guides do
    resources :steps, shallow: true do
      member do
        get 'play', to: 'steps#play'
      end
    end
  end
  resources :categories

  root to: 'guides#index'
  devise_for :users
end
