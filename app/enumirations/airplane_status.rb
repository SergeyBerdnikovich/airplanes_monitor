class AirplaneStatus < EnumerateIt::Base
  associate_values :hangar, :queue, :runway, :fly
end
