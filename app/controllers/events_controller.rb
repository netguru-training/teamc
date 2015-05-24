class EventsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_action :owner!, only: [:edit, :update, :destroy]
  expose_decorated(:events) { find_events }
  expose_decorated(:event, attributes: :product_params) { find_event }
  expose(:searched?) { params[:search].present? }

  def create
    event.owner_id = current_user.id
    if event.save
      redirect_to events_path, notice: 'Event was successfully created.'
    else
      render action: 'new', notice: 'Something went wrong'
    end
  end

  def show

    redirect_to events_path, alert: 'You shall not pass!' unless event.present?
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
    scope = user_signed_in? ? Event.only_public(current_user) : Event.guest

    if searched?
      rooms = Room.near(params[:search][:find_near], 20, units: :km)
      return scope.where(room_id: rooms.map(&:id))
    end

    scope
  end

  def find_event
    if params[:token].present?
      Event.find_by(token: params[:token])
    else
      authenticate_user!
      events.find_by(id: params[:id])
    end
  end

  def invite
    if params[:event][:event_inviter].present?
      EventInviterMailer.event_invite(event.owner, event, params[:event][:event_inviter]).deliver!
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
end
