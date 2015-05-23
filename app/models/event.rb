class Event < ActiveRecord::Base
  has_many :event_games
  has_many :board_games, :through => :event_games

  has_many :participants
  has_many :users, :through => :participants

  belongs_to :room
  belongs_to :owner, class_name: "User"

  accepts_nested_attributes_for :board_games
end
