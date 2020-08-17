Rails.application.routes.draw do
  root to: 'castles#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :castles, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:new, :create, :index]
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
