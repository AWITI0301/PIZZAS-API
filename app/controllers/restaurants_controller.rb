class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: %i[ show edit update destroy ]

    # GET /restaurants or /restaurants.json
    def index
      @restaurants = Restaurant.all
    end
end
