Rails.application.routes.draw do
 root 'users#index'
 get '/users/', to: 'users#index', :as => :index
 get '/users/search/', to: 'users#search', :as => :search
 get '/users/:id', to: 'users#show', :as => :show
end
