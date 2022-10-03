class PizzasController < ApplicationController
end
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

before_action :set_pizza, only: %i[ show edit update destroy ]


def index
  @pizzas = Pizza.all
end

def show
end