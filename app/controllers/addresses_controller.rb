# Handles http requests for Address model.
class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]

  def new
    @address = Address.new
  end

  def edit
    @event = Event.new
  end

  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @address.update(user_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street1, :street2, :city, :state,
                                    :zip_code, :country)
  end
end
