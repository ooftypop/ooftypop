Rails.application.routes.draw do
  devise_for :users

  root "home#index"

  resources :dispatched_emails
  resources :portfolio_items

end
