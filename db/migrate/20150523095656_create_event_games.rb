class CreateEventGames < ActiveRecord::Migration
  def change
    create_table :event_games do |t|
	  	t.integer :event_id, index: true
    	t.integer :board_game_id, index: true
    end
  end
end
