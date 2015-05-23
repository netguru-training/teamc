class Event < ActiveRecord::Base
	has_many :event_games
	has_many :board_games, :through => :event_games
end
