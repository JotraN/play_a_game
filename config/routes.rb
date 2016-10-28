Rails.application.routes.draw do
 root 'users#index'
 get '/search/', to: 'users#search', :as => :search
 get '/:id', to: 'users#show', :as => :show
end
