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

  # POST /restaurant_pizzas or /restaurant_pizzas.json
  def create
    @restaurant_pizza = RestaurantPizza.new(restaurant_pizza_params)

    respond_to do |format|
      if @restaurant_pizza.save
        format.html { redirect_to restaurant_pizza_url(@restaurant_pizza), notice: "Restaurant pizza was successfully created." }
        format.json { render :show, status: :created, location: @restaurant_pizza }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant_pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_pizzas/1 or /restaurant_pizzas/1.json
  def update
    respond_to do |format|
      if @restaurant_pizza.update(restaurant_pizza_params)
        format.html { redirect_to restaurant_pizza_url(@restaurant_pizza), notice: "Restaurant pizza was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant_pizza }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant_pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_pizzas/1 or /restaurant_pizzas/1.json
  def destroy
    @restaurant_pizza.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_pizzas_url, notice: "Restaurant pizza was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_pizza
      @restaurant_pizza = RestaurantPizza.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_pizza_params
      params.require(:restaurant_pizza).permit(:price, :pizza_id, :restaurant_id)
    end
end
