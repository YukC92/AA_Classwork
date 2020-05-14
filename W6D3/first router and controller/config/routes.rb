Rails.application.routes.draw do

  # resources :users
  get "/users", to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/new", to: "users#new"
  get "/users/:id/edit", to: "users#edit"
  post "/users", to: "users#create"
  patch "/user/:id", to: "users#update"
  put "/user/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
