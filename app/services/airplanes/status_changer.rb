class Airplanes::StatusChanger
  attr_reader :airplane, :new_status, :current_status

  def initialize(airplane, new_status)
    @airplane = airplane
    @current_status = airplane.status.to_sym
    @new_status = new_status.to_sym
  end

  def change!
    check_statuses!

    airplane.status = new_status
    airplane.save!
  end

  private

  def check_statuses!
    current_status_idx = statuses.index current_status
    new_status_idx = statuses.index new_status

    if current_status_idx > new_status_idx || (new_status_idx - current_status_idx) != 1
      raise Exception.new('Incorrect status priority!')
    end
  end

  def statuses
    @statuses ||= AirplaneStatus.keys.to_a
  end
end