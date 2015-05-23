class Room < ActiveRecord::Base
  has_many :events
  geocoded_by :address
  after_validation :geocode

  validates :city, :street, presence: true

  def address
    "#{city}, #{street}"
  end

  def to_s
    address + " Room no. #{room_number}"
  end
end
