Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
  	get "/all_products_url" => "products#all_products_method"

  	get "/one_product" => "products#one_product"

  	get "/one_product/:id" => "products#one_product"
  end
end
