 Rails.application.routes.draw do
  resources :users
  resources :animes
  resources :trackeds
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end