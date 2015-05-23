class EventGame < ActiveRecord::Base
	belongs_to :board_game
	belongs_to :event
end
