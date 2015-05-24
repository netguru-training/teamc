class Room < ActiveRecord::Base
  has_many :events
  geocoded_by :to_s
  after_validation :geocode

  validates :city, :street, presence: true

  def to_s
    self.decorate.address
  end
end
