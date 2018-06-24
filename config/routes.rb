Rails.application.routes.draw do
  root 'home#index'

  devise_for :users,
    controllers: {
      confirmations:      'users/confirmations',
      # omniauth_callbacks: 'users/omniauth_callbacks',
      passwords:          'users/passwords',
      registrations:      'users/registrations',
      sessions:           'users/sessions',
      unlocks:            'users/unlocks'
    }

  ActiveAdmin.routes(self)

  resource :user, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end

  resources :users
  resources :dispatched_emails
  resources :portfolio_items
  resources :dashboard

end
