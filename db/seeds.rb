require 'ffaker'

# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html



r = Room.create( city: "New York", street: "Smith Street", room_number: 1 )
u = User.create( name: "Peter Parker", email: "spiderman@example.com",
  password: "password", password_confirmation: "password", age: 15 )
Event.create(
  name: "Event sample",
  description: "Some very convincing description here!",
  datetime: 1.day.from_now,
  room_id: r.id,
  owner_id: u.id,
  token: SecureRandom.uuid
  )


10.times do |i|
  r = Room.create( city: FFaker::Address.city, street: FFaker::Address.street_address, room_number: i )
  name = FFaker::Name.name
  u = User.create( name: name, email: name.gsub(' ', '.') + "@example.com",
    password: "password", password_confirmation: "password", age: i+15 )
  Event.create(
    name: "Event " + (i+10).to_s,
    description: "Some very convincing description here!",
    datetime: i.days.from_now,
    room_id: r.id,
    owner_id: u.id,
    token: SecureRandom.uuid
    )
end

BoardGame.create( name: "Game example", description: "Game description here!", min_players: 1, max_players: 6, min_age: 8,
  img_small__url: "http://media.idownloadblog.com/wp-content/uploads/2013/07/Board-Games-500x373.jpg", img_full_url: "http://media.idownloadblog.com/wp-content/uploads/2013/07/Board-Games-500x373.jpg",
  game_id: 1 )

15.times do |id|
  CreateGameFromBoardgamesgeekApi.new(35420+id).call
end
