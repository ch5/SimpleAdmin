# == Route Map
#
#               Prefix Verb   URI Pattern                       Controller#Action
#                 root GET    /                                 public#index
#                      GET    /show/:permalink(.:format)        public#show
#    delete_admin_user GET    /admin_users/:id/delete(.:format) admin_users#delete
#          admin_users GET    /admin_users(.:format)            admin_users#index
#                      POST   /admin_users(.:format)            admin_users#create
#       new_admin_user GET    /admin_users/new(.:format)        admin_users#new
#      edit_admin_user GET    /admin_users/:id/edit(.:format)   admin_users#edit
#           admin_user PATCH  /admin_users/:id(.:format)        admin_users#update
#                      PUT    /admin_users/:id(.:format)        admin_users#update
#                      DELETE /admin_users/:id(.:format)        admin_users#destroy
#                      GET    /                                 subjects#index
#                admin GET    /admin(.:format)                  access#menu
#         access_login GET    /access/login(.:format)           access#login
#          access_menu GET    /access/menu(.:format)            access#menu
# access_attempt_login POST   /access/attempt_login(.:format)   access#attempt_login
#        access_logout GET    /access/logout(.:format)          access#logout
#       delete_subject GET    /subjects/:id/delete(.:format)    subjects#delete
#             subjects GET    /subjects(.:format)               subjects#index
#                      POST   /subjects(.:format)               subjects#create
#          new_subject GET    /subjects/new(.:format)           subjects#new
#         edit_subject GET    /subjects/:id/edit(.:format)      subjects#edit
#              subject GET    /subjects/:id(.:format)           subjects#show
#                      PATCH  /subjects/:id(.:format)           subjects#update
#                      PUT    /subjects/:id(.:format)           subjects#update
#                      DELETE /subjects/:id(.:format)           subjects#destroy
#          delete_page GET    /pages/:id/delete(.:format)       pages#delete
#                pages GET    /pages(.:format)                  pages#index
#                      POST   /pages(.:format)                  pages#create
#             new_page GET    /pages/new(.:format)              pages#new
#            edit_page GET    /pages/:id/edit(.:format)         pages#edit
#                 page GET    /pages/:id(.:format)              pages#show
#                      PATCH  /pages/:id(.:format)              pages#update
#                      PUT    /pages/:id(.:format)              pages#update
#                      DELETE /pages/:id(.:format)              pages#destroy
#       delete_section GET    /sections/:id/delete(.:format)    sections#delete
#             sections GET    /sections(.:format)               sections#index
#                      POST   /sections(.:format)               sections#create
#          new_section GET    /sections/new(.:format)           sections#new
#         edit_section GET    /sections/:id/edit(.:format)      sections#edit
#              section GET    /sections/:id(.:format)           sections#show
#                      PATCH  /sections/:id(.:format)           sections#update
#                      PUT    /sections/:id(.:format)           sections#update
#                      DELETE /sections/:id(.:format)           sections#destroy
#           demo_index GET    /demo/index(.:format)             demo#index
#           demo_hello GET    /demo/hello(.:format)             demo#hello
#     demo_other_hello GET    /demo/other_hello(.:format)       demo#other_hello
#

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
