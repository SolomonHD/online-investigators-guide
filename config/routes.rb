Rails.application.routes.draw do

  namespace :admin do
    resources :supporting_units
  end
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  namespace :admin do
    resources :pages do
        get :move
    end
    resources :pages
    resources :survey_templates
    resources :labels
    get '', to: 'dashboard#index', as: '/'
  end

  resources :sessions
  resources :pages, :except => ['edit', 'new', 'update', 'destroy']
  resources :users do
    resources :surveys
  end
  get 'sitemap', to:'pages#sitemap', as: 'sitemap'

  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
