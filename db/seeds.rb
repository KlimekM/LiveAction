# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Place.create!(name: "Air Canada Centre", description: "Home of the Toronto Raptors", address: "40 Bay Street", city: "Toronto", state: "Ontario", capacity: 19800, date_opened: Date.new(1999, 2, 19), image_url: "http://hg2.com/wp-content/uploads/2015/07/toronto-play-air-canada-centre-3.jpg")

Place.create!(name: "American Airlines Arena", description: "Home of the Miami Heat", address: "601 Biscayne Blvd", city: "Miami", state: "Florida", capacity: 19600, date_opened: Date.new(1999, 12, 31), image_url: "http://i.cdn.turner.com/drp/nba/heat/sites/default/files/styles/story_main_photo/public/780x521_arena_150127.jpg?itok=J2q4ywQY")

Place.create!(name: "American Airlines Center", description: "Home of the Dallas Mavericks", address: "2500 Victory Avenue", city: "Dallas", state: "Texas", capacity: 19200, date_opened: Date.new(1999, 9, 1), image_url: "http://images2.dallasobserver.com/imager/u/original/6445495/8971675.0.jpg")

Place.create!(name: "Amway Center", description: "Home of the Orlando Magic", address: "400 W Church St #200", city: "Orlando", state: "Florida", capacity: 18846, date_opened: Date.new(2010, 10, 1), image_url: "https://s-media-cache-ak0.pinimg.com/originals/a2/bb/80/a2bb80ca97370e73b1c7cd7013c69328.jpg")

Place.create!(name: "AT&T Center", description: "Home of the San Antonio Spurs", address: "1 AT&T Center Parkway", city: "San Antonio", state: "Texas", capacity: 18581, date_opened: Date.new(2002, 10, 18), image_url: "https://pbs.twimg.com/profile_images/708007965110837248/VtdN345y.jpg")

Place.create!(name: "Bankers Life Fieldhouse", description: "Home of the Indiana Pacers", address: "125 South Pennsylvania Street", city: "Indianapolis", state: "Indiana", capacity: 18165, date_opened: Date.new(1999, 11, 6), image_url: "https://upload.wikimedia.org/wikipedia/commons/f/f9/Bankers_Life_Fieldhouse%2C_Indian%C3%A1polis%2C_Estados_Unidos%2C_2012-10-22%2C_DD_01.jpg")

Place.create!(name: "Barclays Center", description: "Home of the Brooklyn Nets", address: "620 Atlantic Avenue", city: "Brooklyn", state: "New York", capacity: 17732, date_opened: Date.new(2012, 9, 21), image_url: "https://upload.wikimedia.org/wikipedia/commons/5/55/Barclays_Center_western_side.jpg")

Place.create!(name: "BMO Harris Bradley Center", description: "Home of the Milwaukee Bucks", address: "1001 North Fourth Street", city: "Milwaukee", state: "Wisconsin", capacity: 18717, date_opened: Date.new(1988, 10, 1), image_url: "https://upload.wikimedia.org/wikipedia/commons/5/51/Bradley_Center_NE_Entrance.jpg")

Place.create!(name: "Chesapeake Energy Arena", description: "Home of the Oklahoma City Thunder", address: "100 West Reno Avenue", city: "Oklahoma City", state: "Oklahoma", capacity: 18203, date_opened: Date.new(2002, 6, 8), image_url: "https://upload.wikimedia.org/wikipedia/commons/6/65/Chesapeake_energy_arena_night.JPG")

Place.create!(name: "FedEx Forum", description: "Home of the Memphis Grizzlies", address: "191 Beale Street", city: "Memphis", state: "Tennessee", capacity: 18119, date_opened: Date.new(2004, 9, 6), image_url: "https://upload.wikimedia.org/wikipedia/commons/3/37/FedExForum.jpg")

Place.create!(name: "Golden 1 Center", description: "Home of the Sacramento Kings", address: "547 L Street", city: "Sacramento", state: "California", capacity: 17500, date_opened: Date.new(2016, 10, 1), image_url: "https://upload.wikimedia.org/wikipedia/en/b/b3/Rendering_of_Golden_1_Center_Solar_Array%2C_2015.jpg")

Place.create!(name: "Madison Square Garden", description: "Home of the New York Knicks", address: "4 Pennsylvania Plaza", city: "New York", state: "New York", capacity: 19812, date_opened: Date.new(1968, 2, 11), image_url: "https://upload.wikimedia.org/wikipedia/commons/d/dc/Madison_Square_Garden%2C_February_2013.jpg")

Place.create!(name: "Moda Center", description: "Home of the Portland Trail Blazers", address: "1 Center Court", city: "Portland", state: "Oregon", capacity: 19441, date_opened: Date.new(1995, 10, 12), image_url: "https://upload.wikimedia.org/wikipedia/commons/7/74/Moda_Center.JPG")

Place.create!(name: "Oracle Arena", description: "Home of the Golden State Warriors", address: "7000 Coliseum Way", city: "Oakland", state: "California", capacity: 19596, date_opened: Date.new(1966, 11, 9), image_url: "https://upload.wikimedia.org/wikipedia/commons/a/a1/Theoraclearena.jpg")

Place.create!(name: "Pepsi Center", description: "Home of the Denver Nuggets", address: "1000 Chopper Circle", city: "Denver", state: "Colorado", capacity: 19155, date_opened: Date.new(1999, 10, 1), image_url: "https://upload.wikimedia.org/wikipedia/commons/d/d4/Denver_Pepsi_Center_1.jpg")

Place.create!(name: "Philips Arena", description: "Home of the Atlanta Hawks", address: "1 Philips Drive", city: "Atlanta", state: "Georgia", capacity: 18047, date_opened: Date.new(1999, 9, 18), image_url: "https://upload.wikimedia.org/wikipedia/commons/f/fa/Philips_Arena.jpg")

Place.create!(name: "Quicken Loans Arena", description: "Home of the Cleveland Cavaliers", address: "1 Center Court", city: "Cleveland", state: "Ohio", capacity: 20562, date_opened: Date.new(1994, 10, 17), image_url: "https://upload.wikimedia.org/wikipedia/commons/4/46/Quicken_Loans_Arena_4.jpg")

Place.create!(name: "Smoothie King Center", description: "Home of the New Orleans Pelicans", address: "1501 Girod Street", city: "New Orleans", state: "Louisiana", capacity: 16867, date_opened: Date.new(1999, 10, 29), image_url: "https://upload.wikimedia.org/wikipedia/commons/0/00/Smoothie_King_Center.jpg")

Place.create!(name: "Staples Center", description: "Home of the Los Angeles Clippers", address: "1111 South Figueroa Street", city: "Los Angeles", state: "California", capacity: 19060, date_opened: Date.new(1999, 10, 17), image_url: "https://upload.wikimedia.org/wikipedia/commons/2/24/Staples_Center_2012.jpg")

Place.create!(name: "Staples Center", description: "Home of the Los Angeles Lakers", address: "1111 South Figueroa Street", city: "Los Angeles", state: "California", capacity: 18997, date_opened: Date.new(1999, 10, 17), image_url: "https://upload.wikimedia.org/wikipedia/commons/2/24/Staples_Center_2012.jpg")

Place.create!(name: "Talking Stick Resort Arena", description: "Home of the Phoenix Suns", address: "201 East Jefferson Street", city: "Phoenix", state: "Arizona", capacity: 18055, date_opened: Date.new(1992, 6, 6), image_url: "https://upload.wikimedia.org/wikipedia/commons/9/91/Talking_Stick_Resort_Arena.JPG")

Place.create!(name: "Target Center", description: "Home of the Minnesota Timberwolves", address: "600 First Avenue North", city: "Minneapolis", state: "Minnesota", capacity: 19356, date_opened: Date.new(1990, 10, 13), image_url: "https://upload.wikimedia.org/wikipedia/commons/7/7a/Target_Center.jpg")

Place.create!(name: "TD Garden", description: "Home of the Boston Celtics", address: "100 Legends Way", city: "Boston", state: "Massachusetts", capacity: 18624, date_opened: Date.new(1995, 9, 30), image_url: "https://upload.wikimedia.org/wikipedia/commons/6/6a/TD_Garden_%28crop%29.JPG")

Place.create!(name: "The Palace of Auburn Hills", description: "Home of the Detroit Pistons", address: "6 Championship Drive", city: "Auburn Hills", state: "Michigan", capacity: 21231, date_opened: Date.new(1988, 8, 13), image_url: "https://upload.wikimedia.org/wikipedia/commons/a/a9/The_Palace_Detroit_facade.jpg")

Place.create!(name: "Time Warner Cable Arena", description: "Home of the Charlotte Hornets", address: "333 East Trade Street", city: "Charlotte", state: "North Carolina", capacity: 19077, date_opened: Date.new(2005, 10, 21), image_url: "https://upload.wikimedia.org/wikipedia/commons/0/03/TWCArena2012.JPG")

Place.create!(name: "Toyota Center", description: "Home of the Houston Rockets", address: "1510 Polk Street", city: "Houston", state: "Texas", capacity: 18055, date_opened: Date.new(2003, 10, 6), image_url: "https://upload.wikimedia.org/wikipedia/commons/d/db/Toyota_Center_entr.jpg")

Place.create!(name: "United Center", description: "Home of the Chicago Bulls", address: "1901 West Madison Street", city: "Chicago", state: "Illinois", capacity: 20917, date_opened: Date.new(1994, 8, 18), image_url: "https://upload.wikimedia.org/wikipedia/commons/b/b3/United_Center_Exterior.JPG")

Place.create!(name: "Verizon Center", description: "Home of the Washington Wizards", address: "601 F Street Northwest", city: "Washington", state: "D.C.", capacity: 20356, date_opened: Date.new(1997, 12, 2), image_url: "https://upload.wikimedia.org/wikipedia/commons/7/7f/Verizon_Center_wide.jpg")

Place.create!(name: "Vivint Smart Home Arena", description: "Home of the Utah Jazz", address: "301 West South Temple", city: "Salt Lake City", state: "Utah", capacity: 19911, date_opened: Date.new(1991, 10, 4), image_url: "https://upload.wikimedia.org/wikipedia/commons/0/0f/Energy_solutions_arena.jpg")

Place.create!(name: "Wells Fargo Center", description: "Home of the Philadelphia 76ers", address: "3601 South Broad Street", city: "Philadelphia", state: "Pennsylvania", capacity: 21600, date_opened: Date.new(1996, 8, 13), image_url: "https://upload.wikimedia.org/wikipedia/commons/6/61/Wells_Fargo_Center.jpg")
