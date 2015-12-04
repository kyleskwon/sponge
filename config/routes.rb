Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  get 'wikis/new'

  resources :users
  resources :wikis

  root to: 'welcome#index'
end
