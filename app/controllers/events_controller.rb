class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :add_guest]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @possible = @event.possible_guests
  end

  def add_guest
    @event = Event.find(params[:id])
    @guest = User.find(params[:event][:user_id])
    @guest.attending_events.append @event
    redirect_to event_path(@event), notice: "#{@guest.name} was successfully added to the guest list."
  end

  # POST /events/1/remove_guest?event_id=1&user_id=3
  def remove_guest
    @event = Event.find(params[:event_id])
    @guest = User.find(params[:user_id])
    @event.remove(@guest)
    redirect_to event_path(@event), notice: "#{@guest.name} was successfully removed from the guest list."
  end

  def dish_form
    @event = Event.find(params[:event_id])
    @dish = Dish.find(params[:id])
  end

  # POST /events/1/bring_dish?dish_id=6&event_id=1
  def bring_dish
    @event = Event.find(params[:event_id])
    @dish = Dish.find(params[:id])
    @dish.update(dish_params)
    @guest = User.find(current_user.id)
    @guest.dishes << @dish
    # @event.bring(@dish, current_user)
    @dish.decrement_quantity
    redirect_to event_path(@event), notice: "You have successfully claimed a dish."
  end

  # GET /events/new
  def new
    @event = Event.new
    @address = Address.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.create_address(event_params[:address_attributes])
    @event.host = current_user

    respond_to do |format|
      if @event.save
        current_user.hosted_events.append @event
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :location, :date, :start_time,
                                  :end_time, :notes, address_attributes:
                                  [:id, :street1, :street2, :city, :state,
                                    :zip_code, :country])
  end

  def dish_params
    params.require(:dish).permit(:event_id, :user_id, :name, :description, 
                                :quantity, :servings, :user_name, 
                                :quantity_needed, :quantity_requested)
  end
end
