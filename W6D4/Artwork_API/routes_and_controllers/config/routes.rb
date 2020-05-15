Rails.application.routes.draw do

  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only: [:create, :destroy] 

  resources :artworks, except: [:index] do
    resources :comments, only: [:index]
  end

  resources :comments, only: [:index, :create, :destroy]
  # get "/users", to: "users#index"
  # get "/users/:id", to: "users#show"
  # get "/users/new", to: "users#new"
  # get "/users/:id/edit", to: "users#edit"
  # post "/users", to: "users#create"
  # patch "/users/:id", to: "users#update"
  # put "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
