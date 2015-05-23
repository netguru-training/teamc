class AddIdsToParticipants < ActiveRecord::Migration
  def change
  	add_reference :participants, :user
  end
end
