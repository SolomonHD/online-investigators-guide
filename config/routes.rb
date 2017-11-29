Rails.application.routes.draw do

  namespace :admin do
    resources :supporting_units
  end
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'slogout', to: 'omniauth_callbacks#destroy', as: 'shibb_logout'

  namespace :admin do
    resources :pages do
        get :move
    end
    resources :pages
    resources :survey_templates
    resources :labels
    get '', to: 'dashboard#index', as: '/'
    resource :broken_link do
      get :runReport
    end
  end

  resources :sessions
  resources :pages, :except => ['edit', 'new', 'update', 'destroy']
  resources :users do
    resources :surveys
   # get 'sign_in', to: 'omniauth#new', as: :new_user_session
   # post 'sign_in', to: 'omniauth_callbacks#saml', as: :new_session
    #get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  get 'sitemap', to:'pages#sitemap', as: 'sitemap'
  match  '/auth/:provider/callback', :to => 'omniauth_callbacks#saml', via: [:get, :post]
  match  '/auth/:provider/callback_logout', :to => 'omniauth_callbacks#logout', via: [:post]
  match  'pages/auth/:provider/callback', :to => 'omniauth_callbacks#saml', via: [:get, :post]
  root 'pages#index'

  #get '/auth/:provider/callback', to: 'sessions#create'
  #post '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
