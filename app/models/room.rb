class Room < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode

  validates :city, presence: true
  validates :street, presence: true

  def address
    "#{city}, #{street}"
  end
end
