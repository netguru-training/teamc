class EventsController < ApplicationController
  expose(:events) { find_events }
  expose(:event, attributes: :product_params)

  def create
    self.event = Event.new(product_params)
    if event.save
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def destroy
    event.destroy
    redirect_to events_path
  end

  def update
    if self.event.save
      redirect_to events_path
    else
      render action: 'edit'
    end
  end

  def find_events
    if params[:search].present?
      rooms = Room.near(params[:search][:find_near], 20, units: :km)
      Event.where(room_id: rooms.map(&:id))
    else
      Event.all
    end
  end

  private

    def product_params
      params.require(:event).permit(:name, :description, :room_id, :datetime, :board_game_ids)
    end
end
