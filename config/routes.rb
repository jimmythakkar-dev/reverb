Rails.application.routes.draw do
  root 'search_products#index'
  
  get 'search_products' => 'search_products#index'
  post 'search_products/category_lookup'
end
