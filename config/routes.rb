Rails.application.routes.draw do
  resources :pages
  resources :users
  get 'dashboard/index'

  root 'dashboard#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
