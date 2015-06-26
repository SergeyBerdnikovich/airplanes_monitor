class Airplane < ActiveRecord::Base
  paginates_per 10

  scope :on_runway, -> { where(status: AirplaneStatus::RUNWAY) }
end
