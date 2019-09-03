Rails.application.routes.draw do
  # PWA routes
  get '/service_worker.js' => 'service_worker#service_worker'
  get '/manifest.json' => 'service_worker#manifest'
  
  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :products do
    get :who_bought, on: :member
  end

  resources :support_requests, only: [:index, :update]

  scope '(:locale)' do
    # QR code test page
    get 'qr-code' => 'qr_codes#index'

    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
