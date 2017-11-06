Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions
  resources :survey_templates
  resources :labels
  resources :pages
  resources :users do
    resources :surveys
  end

  match :admin, :to => 'pages#index'
  resources :pages do
      get :move
  end

  get 'dashboard/index'

  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
