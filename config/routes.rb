Rails.application.routes.draw do
  get 'home/index'
  get 'dashboard/index'

  resources :locations, except: [:update, :edit, :destroy]

  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  devise_scope :user do
    get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  %w( 404 422 500 ).each do |code|
    get code, to: "errors#show", :code => code
  end

  root to: 'home#index'
end
