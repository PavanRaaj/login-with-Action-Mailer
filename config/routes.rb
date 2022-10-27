Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]  
  get 'signup', to: 'users#new', as: 'signup'  
  get 'login', to: 'sessions#new', as: 'login'  
  get 'logout', to: 'sessions#destroy', as: 'logout' 
  resources :users do
    member do
      get :confirm_email
    end
  end
  get 'page/index'
  
  root 'page#index'  



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
end