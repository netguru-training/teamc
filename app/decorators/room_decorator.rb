class RoomDecorator < Draper::Decorator
  delegate_all

  def address
    "#{city}, #{street}"
  end
end
