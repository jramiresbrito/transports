class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]

  # GET /routes
  def index
    @routes = Route.all
  end

  # GET /routes/1
  def show
  end

  # GET /routes/new
  def new
    @route = Route.new
  end

  # GET /routes/1/edit
  def edit
  end

  # POST /routes
  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route, notice: 'Rota criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /routes/1
  def update
    if @route.update(route_params)
      redirect_to @route, notice: 'Rota atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /routes/1
  def destroy
    @route.destroy
    redirect_to routes_url, notice: 'Rota excluída com sucesso.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_route
    @route = Route.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def route_params
    params.require(:route).permit(:date, :size, :vehicle_id)
  end
end
