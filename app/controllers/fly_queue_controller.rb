class FlyQueueController < ApplicationController
  def create
    FlyQueue::AppendService.new(permitted_params).append!

    redirect_to root_path
  end

  def check
    FlyQueue::Checker.new.call ? redirect_to(root_path) : head(:ok)
  end

  private

  def permitted_params
    params.permit(:airplane_id)
  end
end
