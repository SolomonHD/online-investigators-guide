Rails.application.routes.draw do
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
    get 'sign_in', to: 'omniauth#new', as: :new_user_session
    post 'sign_in', to: 'omniauth_callbacks#saml', as: :new_session
    #get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
  match '/auth/:provider/callback', :to => 'sessions#create'
  root 'pages#index'
  
  #get '/auth/:provider/callback', to: 'sessions#create'
  #post '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
