Rails.application.routes.draw do
  namespace :api do 
    post "/users" => "users#create"

    get '/products' => 'products#index'
    post '/products'=> 'products#create'
    get '/products/:id' => 'products#show'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    post "/sessions" => "sessions#create"
  end 
end

