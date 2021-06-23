class FuelTanksController < ApplicationController
  before_action :set_fuel_tank, only: %i[show edit update destroy]

  # GET /fuel_tanks
  def index
    @fuel_tanks = FuelTank.all
  end

  # GET /fuel_tanks/1
  def show
  end

  # GET /fuel_tanks/new
  def new
    @fuel_tank = FuelTank.new
  end

  # GET /fuel_tanks/1/edit
  def edit
  end

  # POST /fuel_tanks
  def create
    @fuel_tank = FuelTank.new(fuel_tank_params)

    if @fuel_tank.save
      redirect_to @fuel_tank, notice: 'Tanque de combustível criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /fuel_tanks/1
  def update
    if @fuel_tank.update(fuel_tank_params)
      redirect_to @fuel_tank, notice: 'Tanque de combustível atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /fuel_tanks/1
  def destroy
    @fuel_tank.destroy
    redirect_to fuel_tanks_url, notice: 'Tanque de combustível excluído com sucesso.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fuel_tank
    @fuel_tank = FuelTank.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def fuel_tank_params
    params.require(:fuel_tank).permit(:capacity, :amount, :fuel)
  end
end
