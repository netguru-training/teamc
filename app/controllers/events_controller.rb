class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authenticate_show, only: :show
  before_action :owner!, only: [:edit, :update, :destroy]
  expose(:events) { find_events }
  expose(:event, attributes: :product_params)



  def create
    event.owner_id = current_user.id
    if event.save
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render action: 'new', notice: 'Something went wrong'
    end
  end

  def edit
  end

  def destroy
    event.destroy
    redirect_to events_path
  end

  def update
    if event.save
      redirect_to event_path(event)
    else
      render action: 'edit'
    end
  end

  def find_events
    if user_signed_in?
      if params[:search].present?
        rooms = Room.near(params[:search][:find_near], 20, units: :km)
        Event.only_public(current_user).where(room_id: rooms.map(&:id))
      else
        Event.only_public(current_user)
      end
    else
      if params[:search].present?
        rooms = Room.near(params[:search][:find_near], 20, units: :km)
        Event.guest.where(room_id: rooms.map(&:id))
      else
        Event.guest
      end
    end
  end

  def invite
    if params[:email].present?
      EventInviterMailer.event_invite(event.owner_id, event, params[:email]).deliver!
    end
    redirect_to event_path
  end

  private

    def product_params
      params.require(:event).permit(:name, :description, :room_id, :datetime, :private, board_game_ids: [], user_ids: [])
    end

    def owner!
      unless event.owner_id == current_user.id
        redirect_to events_path, {error: "You are not allowed to edit this event."}
      end
    end

    def authenticate_show
      if params[:token].present?
        authenticate_user! unless event.token == params[:token]
      else
        authenticate_user!
      end
    end
end
