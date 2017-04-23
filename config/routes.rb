require 'sidekiq/web'

Rails.application.routes.draw do

  # mount Shrine::DownloadEndpoint => "home/kapranov/edozo/attachments/uploads"
  mount Sidekiq::Web => '/sidekiq'

  %w( 404 422 500 ).each do |code|
    get code, to: "errors#show", code: code
  end

  devise_for :users, :controllers => {
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: :new_user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'errors/show'
  get 'letters/:id' => 'letters#show', as: :letters
  get 'alphabets'   => 'letters#index'
  get 'posts/index'
  get "/feed" => "atoms#index", :as => "feed"

  resources :atoms, only: [:index, :show]
  resources :fantastics, only: [:index, :show]
  resources :home, only: [:index, :show]
  resources :qr_codes, only: [:new, :create]
  resources :payments, only: [:index, :new, :create]
  resources :shoppings, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :googles, only: [:index]
  resources :sessions, only: [:create, :destroy]

  # resources :albums, except: [:update, :edit, :destroy] do
  #   resources :photos
  # end
  #
  # patch "/album" => "photos#update"
  # post "/album/photos" => "photos#create"

  resources :tracks, only: [:index] do
    resources :click_tracks, only: [:index]
  end

  resources :charts, only: [:index] do
    collection do
      get :visits_by_day
      get 'sporters_by_age'
      get 'sporters_by_country'
      get 'results_by_country'
      get 'competitions_by_year'
    end
  end

  resource :calendar, only: [:show], controller: :calendar

  resources :islands do
    resources :interactions, only: [:new, :create, :edit, :update]
  end

  resources :businesses do
    resources :interactions, only: [:new, :create, :edit, :update]
  end

  resources :books, only: [:index, :show]
  resources :ticks
  resources :tacks

  match '/', to: 'ticks#index', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
  match '/', to: 'ticks#show',  constraints: { subdomain: /.+/ },  via: [:get, :post, :put, :patch, :delete]

  resources :sitemap, only: [:index], defaults: {format: 'xml'}
  resources :goods, only: [:index, :edit, :update]
  resources :statistics, only: [:index]
  resources :projects, :categories, :locations
  resources :members, only: [:new, :create]
  resources :fruits, only: [:index]

  resources :products do
    collection { post :import }
  end

  resources :foods do
    get "delete"
  end

  #resources :events do
  #  resources :comments, only: [:show, :create, :destroy]
  #end

  resources :articles, :events do
    resources :comments, only: [:show, :new, :create, :destroy]
  end

  resources :dashboards, only: [:index]

  resources :people, only: [:new, :create] do
    post "/people" => "people#new"
  end

  resources :charges, only: [:new, :create] do
    post "/charges" => "charges#new"
  end

  resources :subscriptions, only: [:new, :create] do
    get 'subscriptions/new'
    post "/subscriptions" => "subscriptions#new"
  end

  resources :albums do
    resources :photos do
      resources :comments, only: [:show, :new, :create, :destroy]
    end
  end

  resources :items do
    resources :item_reviews, only: [:new, :create, :update]
  end

  namespace :api do
    resources :tracks, only: [] do
      resources :click_tracks, only: [:create] do
        collection do
          get 'by_day'
        end
      end
    end
  end

  root to: "home#index"
end
