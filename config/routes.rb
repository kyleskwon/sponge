Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  resources :users
  resources :wikis
  resources :charges, only: [:new, :create]

  get 'charges/downgrade', as: :downgrade

  root to: 'welcome#index'
end
