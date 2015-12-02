Rails.application.routes.draw do
  devise_for :users

  get 'welcome/index'
  get 'wikis/new'

  resources :users, except: [:destroy]
  resources :wikis, except: [:destroy]

  root 'welcome#index'
end
