class PizzasController < ApplicationController
end
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

before_action :set_pizza, only: %i[ show edit update destroy ]


def index
  @pizzas = Pizza.all
end

def show
end

def new
  @pizza = Pizza.new
end


def edit
end

def create
  @pizza = Pizza.new(pizza_params)

  respond_to do |format|
    if @pizza.save
      format.html { redirect_to pizza_url(@pizza), notice: "Pizza was successfully created." }
      format.json { render :show, status: :created, location: @pizza }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @pizza.errors, status: :unprocessable_entity }
    end
  end
end


def update
  respond_to do |format|
    if @pizza.update(pizza_params)
      format.html { redirect_to pizza_url(@pizza), notice: "Pizza was successfully updated." }
      format.json { render :show, status: :ok, location: @pizza }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @pizza.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE
def destroy
  @pizza.destroy

  respond_to do |format|
    format.html { redirect_to pizzas_url, notice: "Pizza was successfully destroyed." }
    format.json { head :no_content }
  end
end

def record_not_found
  # flash[:notice] = "Wrong post it"
  # render 'record_not_found'
  render html: {error: "record not found"}, status: :unprocessable_entity
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_pizza
    @pizza = Pizza.find(params[:id])

  end

  # Only allow a list of trusted parameters through.
  def pizza_params
    params.require(:pizza).permit(:name, :ingredients)
  end
end