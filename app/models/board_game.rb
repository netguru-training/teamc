class BoardGame < ActiveRecord::Base
	has_many :event_games
	has_many :events, :through => :event_games
end
