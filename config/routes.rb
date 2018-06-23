Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users

  root "home#index"

  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  resources :dispatched_emails
  resources :portfolio_items
  resources :dashboard

end
