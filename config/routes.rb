MyBootstrap::Application.routes.draw do
  use_doorkeeper

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :users
    end
  end

  resources :sessions, only: [:new, :create, :destroy]
  match '/login',  to: 'sessions#new', via: 'get'
  match '/logout', to: 'sessions#destroy', via: [:delete, :get]

  root to: 'pages#home'
end
