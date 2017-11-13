Rails.application.routes.draw do


  devise_for :admins
  namespace :admins do
    resources :recipes
    resources :users, only: [:index, :show] do
      resource :premium_users, only: [:update]
    end
    resources :recommendations, only: [:create, :destroy]
  end

  devise_for :users
  namespace :users do
    resource :profile, only: [:show, :edit, :update]
    resource :recipe_users, only: [:create, :destroy]
    resources :recipes, only: [:index]
    resources :recommendations, only: [:index]
  end

  resources :recipes
  get 'tags/:tag', to: 'recipes#index', as: :tag, :constraints  => { :tag => /[^\/]+/ }

  root 'welcome#index'
end
