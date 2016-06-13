# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Place.create!(name: "Air Canada Centre", description: "Home of the Toronto Raptors", address: "40 Bay Street", city: "Toronto", state: "Ontario", capacity: 19800, date_opened: DateTime.new(02, 19, 1999))

Place.create!(name: "American Airlines Arena", description: "Home of the Miami Heat", address: "601 Biscayne Blvd", city: "Miami", state: "Florida", capacity: 19600, date_opened: DateTime.new(12, 31, 1999))

Place.create!(name: "American Airlines Center", description: "Home of the Dallas Mavericks", address: "2500 Victory Avenue", city: "Dallas", state: "Texas", capacity: 19200, date_opened: DateTime.new(09, 01, 1999))




















Place.create!(name: "United Center", description: "Home of the Chicago Bulls", address: "2000 W Madison Ave", capacity: 20000)

Place.create!(name: "Oracle Arena", description: "Home of the Golden State Warriors", address: "1000 W Lake Ave", capacity: 25000)

Place.create!(name: "Boston Garden", description: "Home of the Boston Celtics", address: "500 W Green St", capacity: 18000)
