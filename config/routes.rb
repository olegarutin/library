Rails.application.routes.draw do
  root 'posts#index'

  get 'signup', to: 'authors#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'search', to: 'posts#search'
  get 'vote', to: 'likes#vote'
  get 'status', to: 'comment_statuses#status'

  resources :comment_statuses, only: %i[update]
  resources :sessions
  resources :authors

  resources :posts do
    resources :comments do
      resources :likes
    end
  end
end
