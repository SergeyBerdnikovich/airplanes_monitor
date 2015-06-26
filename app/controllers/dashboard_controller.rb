class DashboardController < ApplicationController
  def index
    @airplanes = Airplane.page(params[:page]).per(params[:per_page])
    @fly_queue = FlyQueue.all
    @airplane_on_runway = Airplane.on_runway.first
    @history_flight = HistoryFlight.all.group_by(&:airplane_id)
  end
end
