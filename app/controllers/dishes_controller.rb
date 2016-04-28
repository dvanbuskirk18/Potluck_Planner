# Handles http requests for Dish model.
class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :set_event

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = Dish.all
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = Dish.new(dish_params)
    @event.dishes.append @dish
    @dish.quantity_needed = @dish.quantity_requested

    respond_to do |format|
      if @dish.save
        format.html { redirect_to event_path(@event), notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: event_dish_path(@event, @dish) }
      else
        format.html { render :new }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to event_path(@event), notice: 'Dish was successfully updated.' }
        format.json { render :show, status: :ok, location: event_dish_path(@event, @path) }
      else
        format.html { render :edit }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event), notice: 'Dish was successfully removed from menu.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dish
    @dish = Dish.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dish_params
    params.require(:dish).permit(:name, :description, :quantity_requested, :quantity_needed, :quantity, :servings, :user_name)
  end
end
