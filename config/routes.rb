Rails.application.routes.draw do
  namespace :api do 
    post "/orders" => "orders#create"
    get '/orders/:id' => 'orders#show'
    get 'orders/' => 'orders#index'

    post "/users" => "users#create"

    get '/products' => 'products#index'
    post '/products'=> 'products#create'
    get '/products/:id' => 'products#show'
    patch '/products/:id' => 'products#update'
    delete '/products/:id' => 'products#destroy'

    post "/sessions" => "sessions#create"
  end 
end

