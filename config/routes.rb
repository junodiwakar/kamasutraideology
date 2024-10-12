Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :blogs, only: [:index, :show]

  resources :categories
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :blogs, except: [:index, :show]
  end
end
