Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :movies, only: [:index, :show]

  root to: "texts#index"
  resources :texts, only: %i(show)
end
