Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  get 'users/index'
  get 'users/show'
  post "posts/:id/destroy" => "posts#destroy"
  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end


  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
