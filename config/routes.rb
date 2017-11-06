Rails.application.routes.draw do

  devise_for :admins
  namespace :admins do
    resources :recipes
  end

  devise_for :users
  namespace :users do
    resource :profile, only: [:show, :edit, :update]
  end

  resources :recipes
  get 'tags/:tag', to: 'recipes#index', as: :tag, :constraints  => { :tag => /[^\/]+/ }

  root 'welcome#index'
end
