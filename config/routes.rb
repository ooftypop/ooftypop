Rails.application.routes.draw do

  devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  ActiveAdmin.routes(self)

  root "home#index"

  devise_for :users
  resources :users
  resources :dispatched_emails
  resources :portfolio_items
  resources :dashboard

end
