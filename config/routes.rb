Rails.application.routes.draw do
  resources :pizzas
  resources :restaurants
  resources :restaurant_pizzas
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
