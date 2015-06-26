class History::StatusWriter
  attr_reader :airplane, :old_status, :new_status

  def initialize(airplane, old_status, new_status)
    @airplane = airplane
    @old_status = old_status
    @new_status = new_status
  end

  def write!
    HistoryFlight.new(history_params).save!
  end

  private

  def history_params
    {
      airplane_id: airplane.id,
      from:        old_status,
      to:          new_status
    }
  end
end
