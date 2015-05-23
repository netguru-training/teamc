class EventsController < ApplicationController
  expose(:events) { find_events }
  expose(:event)

  def find_events
    if params[:find_near].present?
      rooms = Room.near(params[:find_near], 20, units: :km)
      Event.where(room_id: rooms.map(&:id))
    else
      Event.all
    end
  end
end
