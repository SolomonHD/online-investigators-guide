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

  resources :pages do
      get :move
  end

  namespace :admin do |admin|
    get '', to: 'dashboard#index', as: '/'
    resources :pages do
        get :move
    end
    resources :survey_templates
    resources :labels
  end



  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
