class FlyQueue::Checker
  attr_reader :first_queue_element, :airplane

  def initialize
    @first_queue_element = FlyQueue.first
    @airplane = first_queue_element.try(:airplane)
  end

  def call
    return false unless first_queue_element
    return false unless runway_is_free?

    ActiveRecord::Base.transaction do
      Airplanes::StatusChanger.new(airplane, AirplaneStatus::RUNWAY).change!
      first_queue_element.destroy!
    end
    RunwayPusher.perform_in(10.seconds)
    true
  end

  private

  def runway_is_free?
    Airplane.on_runway.limit(1).blank?
  end
end
