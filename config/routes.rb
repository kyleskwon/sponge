Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'

  resources :users
  resources :wikis

  root to: 'welcome#index'
end
