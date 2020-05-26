Rails.application.routes.draw do
  devise_for :users

  root 'top#index'
  resources :lists, except: [:index] do
    put :sort
    resources :cards, except: [:index] do
      put :sort
    end
  end
end