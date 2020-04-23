class VehiclesController < ApplicationController
  def show
    @vehicle = Vehicle.find(params[:id])
  end
end
