Rails.application.routes.draw do
  namespace :api do 
    get "/all_products" => "products#all_products_action"s
  end 
end
