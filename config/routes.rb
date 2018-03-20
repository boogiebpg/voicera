Rails.application.routes.draw do
  resources :meetings do
    resources :highlights, only: [:new, :create]
  end
  resources :highlights, only: [:show]

  root 'meetings#index'
end
