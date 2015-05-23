class RemoveNamesFromParticipants < ActiveRecord::Migration
  def change
  	remove_column :participants, :first_name
  	remove_column :participants, :last_name
  	remove_column :participants, :age
  end
end
