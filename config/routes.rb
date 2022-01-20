Rails.application.routes.draw do
  root 'posts#index'

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :posts do
    resources :comments
  end
end
