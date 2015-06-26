require 'pusher'

class RunwayPusher
  include Sidekiq::Worker

  attr_reader :airplane

  Pusher.url = "http://#{Pusher.key}:#{Pusher.secret}@api.pusherapp.com/apps/#{Pusher.app_id}"

  def perform
    @airplane = Airplane.on_runway.first

    Pusher.trigger('airplanes', 'fly', airplane_data)

    Airplanes::StatusChanger.new(airplane, AirplaneStatus::FLY).change! if airplane
  end

  def airplane_data
    {
      id: airplane.id,
      name: airplane.name,
      current_status: airplane.status,
      new_status: AirplaneStatus::FLY
    }
  end
end
