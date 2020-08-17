Rails.application.routes.draw do
  root to: 'castles#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :castles, only [:index, :show, :new, :create]

  resources :castles do
    resources :reservations, only [:new, :create, :index]
  end

  resources :reservations, only [:index]

  resources :reservations do
    member do
      get :decline
      get :accept
    end
  end

  resources :owners do
    resources :reservations, only [:index]
  end
end
