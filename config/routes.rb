Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/merchants/:merchant_id/dashboard', to: 'merchants#show'
  # get '/merchants/:merchant_id/items', to: 'merchant_items#index'
  # get '/merchants/:merchant_id/invoices', to: 'merchant_invoices#index'
  # get '/merchants/:merchant_id/invoices/:invoice_id', to: 'merchant_invoices#show'

  # get '/merchants/:merchant_id/items/:item_id/edit', to: 'merchant_items#edit'
  # get '/merchants/:merchant_id/items/:item_id', to: 'merchant_items#show'

  # patch '/merchants/:merchant_id/items/:item_id', to: 'merchant_items#update'

  root to: 'welcome#index'
  
  get '/merchants/:id/dashboard', to: 'merchants#show'


  # patch '/merchants/:id/'

  resources :merchants, only: %i[show update new] do
    resources :bulk_discounts, controller: 'bulk_discounts', only: %i[index show new create]
    resources :invoices, controller: 'merchant_invoices', only: %i[index show update]
    resources :items, controller: 'merchant_items', only: %i[index edit show update new create]
  end

  resources :admin, only: [:index]

  namespace :admin do
    resources :merchants, only: %i[index show edit update new create]
    resources :invoices, only: %i[index show update]
  end
end

