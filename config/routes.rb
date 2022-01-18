Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    resources :comments, except: %i[new show]
  end
end
