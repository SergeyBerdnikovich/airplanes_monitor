class AirplanesController < ApplicationController
  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(permitted_params)

    flash[:notice] = @airplane.save ? 'Success' : 'Fail'
    redirect_to root_path
  end

  private

  def permitted_params
    params.require(:airplane).permit(:name)
  end
end
