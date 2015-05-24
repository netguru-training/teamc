require 'ffaker'

# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html


4.times do |i|
  r = Room.create( city: "New York", street: "Smith Street", room_number: i )
  u = User.create( name: "Peter Parker", email: "spiderman" + i.to_s + "@example.com",
    password: "password", password_confirmation: "password", age: i+15 )
  Event.create(
    name: "Event " + i.to_s,
    description: "Some very convincing description here!",
    datetime: i.minutes.from_now,
    room_id: r.id,
    owner_id: u.id
    )
end

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
    owner_id: u.id
    )
end

10.times do |i|
  BoardGame.create( name: "Game " + i.to_s, description: "Game description here!", min_players: 1, max_players: i+2, min_age: i+3,
    img_small__url: "http://media.idownloadblog.com/wp-content/uploads/2013/07/Board-Games-500x373.jpg", img_full_url: "http://media.idownloadblog.com/wp-content/uploads/2013/07/Board-Games-500x373.jpg",
    game_id: (i+2)*5 )
end
