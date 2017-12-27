Rails.application.routes.draw do

  namespace :admin do
    resources :site_informations
  end
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
    resources :survey_templates do
      get :toggle_default
    end
    resources :labels
    resources :users do
      get :toggle_admin
    end
    get '', to: 'dashboard#index', as: '/'
    resource :broken_link do
      get :runReport
    end
  end

  resources :sessions
  resources :omniauth_callbacks, only: :index do
    collection do
      get :single_logout
    end
  end

  resources :pages, :except => ['edit', 'new', 'update', 'destroy']
  resources :users do
    resources :surveys, :path => 'views' do
      get :toggle_default
    end
  end
  get 'sitemap', to:'pages#sitemap', as: 'sitemap'
  match  '/auth/:provider/callback', :to => 'omniauth_callbacks#saml', via: [:get, :post]
  match  'pages/auth/:provider/callback', :to => 'omniauth_callbacks#saml', via: [:get, :post]
  root 'pages#index'
  get '/search' => 'pages#search'
end
