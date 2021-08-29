Rails.application.routes.draw do
scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
  root 'homes#top'

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    patch 'withdrawal' => 'users#withdrawal'
  end

  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :post_comments

    resource :favorites, only: [:create, :destroy]
  end

  resources :tag, only: [] do
    get 'posts', to: 'posts#search'
  end

  resources :areas, only: [:index, :show]
  get 'search_city/:id', to: 'areas#search', as: :search_city
  
  namespace :admin do
    resources :users, only: [:index, :edit, :update]
  end
  
  get 'searches' => 'searches#search'
  
  
    
  end

end
