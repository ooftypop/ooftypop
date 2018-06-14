Rails.application.routes.draw do
<<<<<<< Updated upstream

=======
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
>>>>>>> Stashed changes
  devise_for :users

  root "home#index"

  resources :users
  resources :dispatched_emails
  resources :portfolio_items
  resources :dashboard

end
