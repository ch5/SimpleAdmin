Rails.application.routes.draw do

  root :to => 'public#index'

  get 'show/:permalink', :to => 'public#show'

  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end

  root 'subjects#index'

  get 'admin', :to => 'access#menu'
  get 'access/login'
  get 'access/menu'
  post 'access/attempt_login'
  get 'access/logout'

  resources :subjects do
    member do
      get :delete
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  get 'demo/index'
  get 'demo/hello'
  get 'demo/other_hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
