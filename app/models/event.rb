class Event < ActiveRecord::Base
  cattr_accessor :current_user

  has_many :event_games
  has_many :board_games, :through => :event_games

  has_many :participants
  has_many :users, :through => :participants

  belongs_to :room
  belongs_to :owner, class_name: "User"

  accepts_nested_attributes_for :board_games

  scope :only_public,->{ where("private = 'f' OR (owner_id = ? AND private = 't')", current_user) }

  scope :guest, -> { where("private = 'f'") }

  validates :room, :owner, presence: true
  validates :name, presence: true, uniqueness: true

    def owner?(user)
      owner_id == user.id
    end
end
