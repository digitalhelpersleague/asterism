Rails.application.routes.draw do

  get 'welcome/index'
  get 'welcome/about'

  resources :sips
  resources :extensions

  root 'welcome#index'

end
