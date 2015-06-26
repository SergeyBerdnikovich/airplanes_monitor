class DashboardController < ApplicationController
  def index
    @airplanes = Airplane.page(params[:page]).per(params[:per_page])
    @fly_queue = FlyQueue.all
    @airplane_on_runway = Airplane.on_runway.first
  end
end
