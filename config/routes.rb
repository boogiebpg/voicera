Rails.application.routes.draw do
  resources :meetings do
    resources :highlights
  end

  root 'meetings#index'
end
