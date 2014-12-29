Rails.application.routes.draw do

  get 'welcome/index'
  get 'welcome/about'
  get '/under_construction', to: 'welcome#under_construction'
  get '/extensions/search', to: 'extensions#search'

  resources :routers, except: [:new, :edit]
  resources :sips, except: [:new, :edit]
  resources :ivrs, except: [:new, :edit]
  resources :call_queues, except: [:new, :edit]

  #root redirect: { controller: 'welcome', action: 'index' }

  get '/404', to: 'errors#error_404'
  get '/500', to: 'errors#error_500'

  match '*q', to: 'errors#error_404', via: :get
end
