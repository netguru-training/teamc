require 'ffaker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html


4.times do |i|
  r = Room.create( city: "New York", street: "Smith Street", room_number: i )
  u = User.create( name: "Peter Parker", email: "spiderman" + i.to_s + "@example.com", password: "password", password_confirmation: "password" )
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
  u = User.create( name: name, email: name.gsub(' ', '.') + "@example.com", password: "password", password_confirmation: "password" )
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