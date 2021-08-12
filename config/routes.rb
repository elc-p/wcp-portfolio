Rails.application.routes.draw do

  root 'homes#top'

  devise_for :users

  resources :users

  resources :posts do
    resources :post_comments
    resource :favorites, only: [:create, :destroy]
  end

end
