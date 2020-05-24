Rails.application.routes.draw do
  devise_for :users
  resources cards  do
    put :sort
  end
  root 'top#index'
  resources :lists, only: [:new, :create, :edit, :update, :destroy] do
    resources :cards, except: [:index]
  end
    
end