Rails.application.routes.draw do
  devise_for :users
  root to: 'castles#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :castles, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index] do
    member do
      patch :decline
      patch :accept
    end
  end

  namespace :owners do
    resources :reservations, only: [:index]
  end
end
