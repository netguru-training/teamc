class Event < ActiveRecord::Base
	has_many :event_games
	has_many :board_games, :through => :event_games

	has_many :participants
  	has_many :users, :through => :participants

      belongs_to :room
end
