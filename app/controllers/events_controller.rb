class EventsController < ApplicationController
  expose(:events) { find_events }
  expose(:event)

  def find_events
    if params[:search].present?
      rooms = Room.near(params[:search][:find_near], 20, units: :km)
      Event.where(room_id: rooms.map(&:id))
    else
      Event.all
    end
  end
end
