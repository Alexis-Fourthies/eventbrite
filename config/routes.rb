Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :attendances
  end
  resources :users, only: [:show]
  
end
