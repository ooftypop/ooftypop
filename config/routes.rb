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

  # resource :user, only: [:edit] do
  #   collection do
  #     patch 'update_password'
  #   end
  # end

  get '/users/update_password/:id', to: 'users#update_password', as: 'update_password'

  resources :users, :dispatched_emails, :portfolio_items, :dashboard

end
