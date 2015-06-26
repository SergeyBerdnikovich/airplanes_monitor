module ApplicationHelper
  def approve_button_for(airplane)
    options = {
      class: 'btn btn-info btn-sm',
      remote: true,
      method: :post
    }
    options.merge!(disabled: true) unless airplane.status == AirplaneStatus::HANGAR

    link_to 'Aprove flight', fly_queue_index_path(airplane_id: airplane.id), options
  end
end
