class RestaurantPizzasController < ApplicationController
    before_action :set_restaurant_pizza, only: %i[ show edit update destroy ]

    # GET /restaurant_pizzas or /restaurant_pizzas.json
    def index
      @restaurant_pizzas = RestaurantPizza.all
    end
  
    # GET /restaurant_pizzas/1 or /restaurant_pizzas/1.json
    def show
    end
  
    # GET /restaurant_pizzas/new
    def new
      @restaurant_pizza = RestaurantPizza.new
    end
  
    # GET /restaurant_pizzas/1/edit
    def edit
    end
end
