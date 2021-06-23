class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: %i[show edit update destroy]

  # GET /maintenances
  def index
    @maintenances = Maintenance.all
  end

  # GET /maintenances/1
  def show
  end

  # GET /maintenances/new
  def new
    @maintenance = Maintenance.new
  end

  # GET /maintenances/1/edit
  def edit
  end

  # POST /maintenances
  def create
    @maintenance = Maintenance.new(maintenance_params)

    if @maintenance.save
      redirect_to @maintenance, notice: 'Manutenção criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /maintenances/1
  def update
    if @maintenance.update(maintenance_params)
      redirect_to @maintenance, notice: 'Manutenção atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /maintenances/1
  def destroy
    @maintenance.destroy
    redirect_to maintenances_url, notice: 'Manutenção excluída com sucesso.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_maintenance
    @maintenance = Maintenance.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def maintenance_params
    params.require(:maintenance).permit(:date, :distance_traveled, :tipo, :vehicle_id)
  end
end
