Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :accounts
  root "posts#index"
  get 'users', to: 'user#index'
  resources :profiles
  resources :follows
  resources :posts
  resources :comments
  resources :likes
  get 'following', to: 'follows#following'
  get 'follower', to: 'follows#follower'

end
