class DashboardController < ApplicationController
  def index
    @airplanes = Airplane.page(params[:page]).per(params[:per_page])
    @fly_queue = FlyQueue.all
  end
end
