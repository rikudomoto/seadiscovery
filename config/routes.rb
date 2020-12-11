Rails.application.routes.draw do
  root to: 'seas#index'
  devise_for :users
  resources :seas, only: [:new,:create] 
  resources :homes, only:[:index,:show,:edit,:update,:destroy]
end
