require 'ffaker'

# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

sample_games_count = 15

game_example = BoardGame.create( name: "Game example", description: "Game description here!", min_players: 1, max_players: 6, min_age: 8,
  img_small__url: "http://media.idownloadblog.com/wp-content/uploads/2013/07/Board-Games-500x373.jpg", img_full_url: "http://media.idownloadblog.com/wp-content/uploads/2013/07/Board-Games-500x373.jpg",
  game_id: 1 )

sample_games_count.times do |id|
  CreateGameFromBoardgamesgeekApi.new(35420+id).call
end

sample_games = BoardGame.limit sample_games_count

r = Room.create( city: "New York", street: "Smith Street", room_number: 1 )
u = User.create( name: "Peter Parker", email: "spiderman@example.com",
  password: "password", password_confirmation: "password", age: 15 )
e = Event.create(
  name: "Event sample",
  description: "Some very convincing description here!",
  datetime: 1.day.from_now,
  room_id: r.id,
  owner_id: u.id,
  token: SecureRandom.uuid
  )
e.board_games << game_example


10.times do |i|
  r = Room.create( city: FFaker::Address.city, street: FFaker::Address.street_address, room_number: i )
  name = FFaker::Name.name
  u = User.create( name: name, email: name.gsub(' ', '.') + "@example.com",
    password: "password", password_confirmation: "password", age: i+15 )
  e = Event.create(
    name: "Event " + (i+10).to_s,
    description: "Some very convincing description here!",
    datetime: i.days.from_now,
    room_id: r.id,
    owner_id: u.id,
    token: SecureRandom.uuid
    )
  rand(5).times do |i|
    e.board_games << sample_games[rand(sample_games_count)]
  end
end
