Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :blogs

  resources :categories
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    resources :blogs, except:[:show]
  end
end
