Rails.application.routes.draw do

  devise_for :users

  root "home#index"

  resources :users
  resources :dispatched_emails
  resources :portfolio_items
  resources :dashboard

end
