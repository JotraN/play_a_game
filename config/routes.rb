Rails.application.routes.draw do
 get '/users/search/', to: 'users#search', :as => :search
 resources :users
end
