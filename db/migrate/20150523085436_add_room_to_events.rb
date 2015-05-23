class AddRoomToEvents < ActiveRecord::Migration
  def change
  	#add_column :events, :room_id. :integer
  	add_reference :events, :room
  end
end
