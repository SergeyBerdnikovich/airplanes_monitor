class FlyQueue::AppendService
  attr_reader :airplane, :fly_queue

  def initialize(params)
    @fly_queue = FlyQueue.new(params)
    @airplane = fly_queue.airplane
  end

  def append!
    raise Exception.new('Airplane is already in queue') if airplane_in_queue?

    ActiveRecord::Base.transaction do
      fly_queue.save!
      Airplanes::StatusChanger.new(airplane, AirplaneStatus::QUEUE).change!
    end
  end

  private

  def airplane_in_queue?
    FlyQueue.where(airplane_id: airplane.id).present?
  end
end
