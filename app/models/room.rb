class Room < ActiveRecord::Base
  has_many :events
  geocoded_by :address
  after_validation :geocode

  validates :city, presence: true
  validates :street, presence: true

  def address
    "#{city}, #{street}"
  end
end
