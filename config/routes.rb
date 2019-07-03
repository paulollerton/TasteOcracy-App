Rails.application.routes.draw do

  namespace :api do

    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    get "/recipes" => "recipes#index"
    get "/recipes/:id" => "recipes#show"
    post "/recipes" => "recipes#create"
    patch "/recipes/:id" => "recipes#update"
    delete "/recipes/:id" => "recipes#destroy"

    get "/suggestions" => "suggestions#index"
    get "/suggestions/:id" => "suggestions#show"
    post "/suggestions" => "suggestions#create"
    patch "/suggestions/:id" => "suggestions#update"
    delete "/suggestions/:id" => "suggestions#destroy"

    get "/comments" => "comments#index"
    get "/comments/:id" => "comments#show"
    post "/comments" => "comments#create"
    patch "/comments/:id" => "comments#update"
    delete "/comments/:id" => "comments#destroy"

    get "/votes/:id" => "votes#show"
    post "/votes" => "votes#create"
    delete "/votes/:id" => "votes#destroy"

    post "/sessions" => "sessions#create"
  
  end
end
