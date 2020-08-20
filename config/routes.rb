 Rails.application.routes.draw do
  get 'sessions/new', to: 'sessions#new', as: "new_login"
  post 'sessions/create', to: 'sessions#create', as: 'login'
  delete 'sessions/logout', to: 'sessions#logout', as: 'logout'


  resources :users
  resources :animes
  # resources :trackeds
  resources :reviews
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
