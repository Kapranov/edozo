Rails.application.routes.draw do

  %w( 404 422 500 ).each do |code|
    get code, to: "errors#show", :code => code
  end

  get 'home/index'

  root to: 'home#index'
end
