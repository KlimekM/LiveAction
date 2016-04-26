# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Place.create!(name: "United Center", description: "Home of the Bulls", address: "2000 W Madison Ave", capacity: 20000)

Place.create!(name: "Oracle Arena", description: "Home of the Warriors", address: "1000 W Lake Ave", capacity: 25000)

Place.create!(name: "Boston Garden", description: "Home of the Celtics", address: "500 W Green St", capacity: 18000)
