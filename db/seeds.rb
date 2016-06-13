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

Place.create!(name: "Amway Center", description: "Home of the Orlando Magic", address: "400 W Church St #200", city: "Orlando", state: "Florida", capacity: 18846, date_opened: DateTime.new(10, 01, 2010))

Place.create!(name: "AT&T Center", description: "Home of the San Antonio Spurs", address: "1 AT&T Center Parkway", city: "San Antonio", state: "Texas", capacity: 18581, date_opened: DateTime.new(10, 18, 2002))

Place.create!(name: "Bankers Life Fieldhouse", description: "Home of the Indiana Pacers", address: "125 South Pennsylvania Street", city: "Indianapolis", state: "Indiana", capacity: 18165, date_opened: DateTime.new(11, 06, 1999))

Place.create!(name: "Barclays Center", description: "Home of the Brooklyn Nets", address: "620 Atlantic Avenue", city: "Brooklyn", state: "New York", capacity: 17732, date_opened: DateTime.new(09, 21, 2012))

Place.create!(name: "BMO Harris Bradley Center", description: "Home of the Milwaukee Bucks", address: "1001 North Fourth Street", city: "Milwaukee", state: "Wisconsin", capacity: 18717, date_opened: DateTime.new(10, 01, 1988))

Place.create!(name: "Chesapeake Energy Arena", description: "Home of the Oklahoma City Thunder", address: "100 West Reno Avenue", city: "Oklahoma City", state: "Oklahoma", capacity: 18203, date_opened: DateTime.new(06, 08, 2002))

Place.create!(name: "FedEx Forum", description: "Home of the Memphis Grizzlies", address: "191 Beale Street", city: "Memphis", state: "Tennessee", capacity: 18119, date_opened: DateTime.new(09, 06, 2004))

Place.create!(name: "Golden 1 Center", description: "Home of the Sacramento Kings", address: "547 L Street", city: "Sacramento", state: "California", capacity: 17500, date_opened: DateTime.new(10, 01, 2016))

Place.create!(name: "Madison Square Garden", description: "Home of the New York Knicks", address: "4 Pennsylvania Plaza", city: "New York", state: "New York", capacity: 19812, date_opened: DateTime.new(02, 11, 1968))

Place.create!(name: "Moda Center", description: "Home of the Portland Trail Blazers", address: "1 Center Court", city: "Portland", state: "Oregon", capacity: 19441, date_opened: DateTime.new(10, 12, 1995))

Place.create!(name: "Oracle Arena", description: "Home of the Golden State Warriors", address: "7000 Coliseum Way", city: "Oakland", state: "California", capacity: 19596, date_opened: DateTime.new(11, 09, 1966))

Place.create!(name: "Pepsi Center", description: "Home of the Denver Nuggets", address: "1000 Chopper Circle", city: "Denver", state: "Colorado", capacity: 19155, date_opened: DateTime.new(10, 01, 1999))

Place.create!(name: "Philips Arena", description: "Home of the Atlanta Hawks", address: "1 Philips Drive", city: "Atlanta", state: "Georgia", capacity: 18047, date_opened: DateTime.new(09, 18, 1999))

Place.create!(name: "Quicken Loans Arena", description: "Home of the Cleveland Cavaliers", address: "1 Center Court", city: "Cleveland", state: "Ohio", capacity: 20562, date_opened: DateTime.new(10, 17, 1994))

Place.create!(name: "Smoothie King Center", description: "Home of the New Orleans Pelicans", address: "1501 Girod Street", city: "New Orleans", state: "Louisiana", capacity: 16867, date_opened: DateTime.new(10, 29, 1999))












Place.create!(name: "United Center", description: "Home of the Chicago Bulls", address: "2000 W Madison Ave", capacity: 20000)

Place.create!(name: "Boston Garden", description: "Home of the Boston Celtics", address: "500 W Green St", capacity: 18000)
