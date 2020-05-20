Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #http_method "path", to: "controller#action" write them in this way for custom routes 
  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show"
  # post "/users", to: "users#create"
  # patch "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"

  # resources :users -> this gives all RESTful routes 

  #resources :users, except: [:new, :edit ] #we can filter 
  resources :users do 
    resources :chirps, only: [ :index ] #nesting the chirp index 
  end
  # resources :chirps, only: [:index] #but do we want this?????? (no....)
  resources :chirps, only: [ :show ]

  resource :session, only: [:new, :create, :destroy]
end
