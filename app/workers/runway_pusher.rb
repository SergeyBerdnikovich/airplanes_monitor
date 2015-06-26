require 'pusher'

class RunwayPusher
  include Sidekiq::Worker

  Pusher.url = "http://#{Pusher.key}:#{Pusher.secret}@api.pusherapp.com/apps/#{Pusher.app_id}"

  def perform
    airplane = Airplane.on_runway.first
    Airplanes::StatusChanger.new(airplane, AirplaneStatus::FLY).change! if airplane

    Pusher.trigger('airplanes', 'fly', { airplane_id: airplane.id })
  end
end
