Rails.application.routes.draw do
  namespace :admins do
    resources :recipes
  end

  resources :recipes
  get 'tags/:tag', to: 'recipes#index', as: :tag, :constraints  => { :tag => /[^\/]+/ }

  root 'welcome#index'
end
