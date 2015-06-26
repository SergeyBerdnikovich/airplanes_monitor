class HistoryFlight < ActiveRecord::Base
  self.table_name = :history_flight

  belongs_to :airplane
end
