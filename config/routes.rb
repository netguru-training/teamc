Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users

  resources :events do
    resources :participants, only: [:create, :destroy]
  end

  resources :board_games
end
