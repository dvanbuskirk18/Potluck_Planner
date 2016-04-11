class DietaryRestrictionsController < ApplicationController
  before_action :set_dietary_restriction, only: [:show, :edit, :update, :destroy]

  # GET /dietary_restrictions/new
  def new
    @dietary_restriction = DietaryRestriction.new
  end

  # GET /dietary_restrictions/1/edit
  def edit
  end

  # POST /dietary_restrictions
  # POST /dietary_restrictions.json
  def create
    @dietary_restriction = DietaryRestriction.new(dietary_restriction_params)

    respond_to do |format|
      if @dietary_restriction.save
        format.html { redirect_to @dietary_restriction, notice: 'Dietary restriction was successfully created.' }
        format.json { render :show, status: :created, location: @dietary_restriction }
      else
        format.html { render :new }
        format.json { render json: @dietary_restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dietary_restrictions/1
  # PATCH/PUT /dietary_restrictions/1.json
  def update
    respond_to do |format|
      if @dietary_restriction.update(dietary_restriction_params)
        format.html { redirect_to @dietary_restriction, notice: 'Dietary restriction was successfully updated.' }
        format.json { render :show, status: :ok, location: @dietary_restriction }
      else
        format.html { render :edit }
        format.json { render json: @dietary_restriction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dietary_restrictions/1
  # DELETE /dietary_restrictions/1.json
  def destroy
    @dietary_restriction.destroy
    respond_to do |format|
      format.html { redirect_to dietary_restrictions_url, notice: 'Dietary restriction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dietary_restriction
      @dietary_restriction = DietaryRestriction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dietary_restriction_params
      params.require(:dietary_restriction).permit(:vegan, :vegetarian, :gluten, :lactose, :egg, :fish, :shellfish, :peanuts, :tree_nuts, :soy, :kosher, :halal, :notes)
    end
end
