Rails.application.routes.draw do

  get 'home/index'

  %w( 404 422 500 ).each do |code|
    get code, to: "errors#show", :code => code
  end

  root to: 'home#index'
end
