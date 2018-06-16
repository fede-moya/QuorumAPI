# config/routes.rb
Rails.application.routes.draw do
  resources :users
  post 'quorums', to: 'quorums#create'
  post 'login', to: 'users#authenticate'
  post 'signup', to: 'users#create'
end
