Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  namespace :admins do
    resources :recipes
  end

  resources :recipes
  get 'tags/:tag', to: 'recipes#index', as: :tag, :constraints  => { :tag => /[^\/]+/ }

  root 'welcome#index'
end
