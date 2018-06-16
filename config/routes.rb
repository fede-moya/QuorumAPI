# config/routes.rb
Rails.application.routes.draw do
  resources :users
  post 'login', to: 'users#authenticate'
  post 'signup', to: 'users#create'
end
