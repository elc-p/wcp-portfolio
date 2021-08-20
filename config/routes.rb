Rails.application.routes.draw do

  root 'homes#top'

  devise_for :users

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    patch 'withdrawal' => 'users#withdrawal'
  end

  resources :posts do
    resources :post_comments

    resource :favorites, only: [:create, :destroy]
  end

  resources :tag do
    get 'posts', to: 'posts#search'
  end

  resources :areas
  get 'search_city/:id', to: 'areas#search', as: :search_city

end
