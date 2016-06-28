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

Place.create!(name: "Bankers Life Fieldhouse", description: "Home of the Indiana Pacers", address: "125 South Pennsylvania Street", city: "Indianapolis", state: "Indiana", capacity: 18165, date_opened: Date.new(1999, 11, 6), image_url: "http://www.gannett-cdn.com/-mm-/19f6170161ff74a0374a7524ef7579b93db6a7ae/c=234-0-1758-1146&r=x513&c=680x510/local/-/media/Indianapolis/Indianapolis/2014/11/06/635508703261142182-2199645.JPG")

Place.create!(name: "Barclays Center", description: "Home of the Brooklyn Nets", address: "620 Atlantic Avenue", city: "Brooklyn", state: "New York", capacity: 17732, date_opened: Date.new(2012, 9, 21), image_url: "http://aegworldwide.com/media/images/detail/barclays-center_0.jpg")

Place.create!(name: "BMO Harris Bradley Center", description: "Home of the Milwaukee Bucks", address: "1001 North Fourth Street", city: "Milwaukee", state: "Wisconsin", capacity: 18717, date_opened: Date.new(1988, 10, 1), image_url: "http://onmilwaukee.com/images/articles/br/bradleycenterbarguide/bradleycenterbarguide_story1.jpg")

Place.create!(name: "Chesapeake Energy Arena", description: "Home of the Oklahoma City Thunder", address: "100 West Reno Avenue", city: "Oklahoma City", state: "Oklahoma", capacity: 18203, date_opened: Date.new(2002, 6, 8), image_url: "http://smgworld.com/wp-content/uploads/Chesapeake-Energy-Arena_THUNDER_Ext.jpeg")

Place.create!(name: "FedEx Forum", description: "Home of the Memphis Grizzlies", address: "191 Beale Street", city: "Memphis", state: "Tennessee", capacity: 18119, date_opened: Date.new(2004, 9, 6), image_url: "http://s3.evcdn.com/images/edpborder500/I0-001/003/991/626-9.jpeg_/fedexforum-26.jpeg")

Place.create!(name: "Golden 1 Center", description: "Home of the Sacramento Kings", address: "547 L Street", city: "Sacramento", state: "California", capacity: 17500, date_opened: Date.new(2016, 10, 1), image_url: "http://i.cdn.turner.com/drp/nba/kings/sites/default/files/styles/main_gallery_photo__480_tall/public/g1c_panel6.jpg?itok=EZq_b-sA")

Place.create!(name: "Madison Square Garden", description: "Home of the New York Knicks", address: "4 Pennsylvania Plaza", city: "New York", state: "New York", capacity: 19812, date_opened: Date.new(1968, 2, 11), image_url: "http://basketball.ballparks.com/NBA/NewYorkKnicks/front.jpg")

Place.create!(name: "Moda Center", description: "Home of the Portland Trail Blazers", address: "1 Center Court", city: "Portland", state: "Oregon", capacity: 19441, date_opened: Date.new(1995, 10, 12), image_url: "http://i.cdn.turner.com/drp/nba/blazers/sites/default/files/styles/story_main_photo/public/untitled-1_22.jpg?itok=tqfPQgFC")

Place.create!(name: "Oracle Arena", description: "Home of the Golden State Warriors", address: "7000 Coliseum Way", city: "Oakland", state: "California", capacity: 19596, date_opened: Date.new(1966, 11, 9), image_url: "http://oraclearena.s3.amazonaws.com/img/Oracle-Arena-2.jpg")

Place.create!(name: "Pepsi Center", description: "Home of the Denver Nuggets", address: "1000 Chopper Circle", city: "Denver", state: "Colorado", capacity: 19155, date_opened: Date.new(1999, 10, 1), image_url: "https://www.pepsicenter.com/media/1347/Arena-Header.jpg")

Place.create!(name: "Philips Arena", description: "Home of the Atlanta Hawks", address: "1 Philips Drive", city: "Atlanta", state: "Georgia", capacity: 18047, date_opened: Date.new(1999, 9, 18), image_url: "http://d1ya1fm0bicxg1.cloudfront.net/14-08222012-5035b6cdacc64.jpeg")

Place.create!(name: "Quicken Loans Arena", description: "Home of the Cleveland Cavaliers", address: "1 Center Court", city: "Cleveland", state: "Ohio", capacity: 20562, date_opened: Date.new(1994, 10, 17), image_url: "http://www.theqarena.com/assets/img/theq-day-outside.jpg")

Place.create!(name: "Smoothie King Center", description: "Home of the New Orleans Pelicans", address: "1501 Girod Street", city: "New Orleans", state: "Louisiana", capacity: 16867, date_opened: Date.new(1999, 10, 29), image_url: "http://l.yimg.com/bt/api/res/1.2/DxqlbYxCEIEGUnhe13O8YA--/YXBwaWQ9eW5ld3NfbGVnbztxPTg1O3c9NjMw/http://media.zenfs.com/en/blogs/sptusnbaexperts/SKoutside.jpg")

Place.create!(name: "Staples Center", description: "Home of the Los Angeles Clippers", address: "1111 South Figueroa Street", city: "Los Angeles", state: "California", capacity: 19060, date_opened: Date.new(1999, 10, 17), image_url: "http://aegworldwide.com/media/images/detail/staplescenter_0.jpg")

Place.create!(name: "Staples Center", description: "Home of the Los Angeles Lakers", address: "1111 South Figueroa Street", city: "Los Angeles", state: "California", capacity: 18997, date_opened: Date.new(1999, 10, 17), image_url: "http://aegworldwide.com/media/images/detail/staplescenter_0.jpg")

Place.create!(name: "Talking Stick Resort Arena", description: "Home of the Phoenix Suns", address: "201 East Jefferson Street", city: "Phoenix", state: "Arizona", capacity: 18055, date_opened: Date.new(1992, 6, 6), image_url: "http://www.valleymetro.org/images/uploads/talking-stick.JPG")

Place.create!(name: "Target Center", description: "Home of the Minnesota Timberwolves", address: "600 First Avenue North", city: "Minneapolis", state: "Minnesota", capacity: 19356, date_opened: Date.new(1990, 10, 13), image_url: "http://www.tcdailyplanet.net/wp-content/uploads/files/15/14/target-center-s-main.jpg")

Place.create!(name: "TD Garden", description: "Home of the Boston Celtics", address: "100 Legends Way", city: "Boston", state: "Massachusetts", capacity: 18624, date_opened: Date.new(1995, 9, 30), image_url: "http://basketball.ballparks.com/NBA/BostonCeltics/front.jpg")

Place.create!(name: "The Palace of Auburn Hills", description: "Home of the Detroit Pistons", address: "6 Championship Drive", city: "Auburn Hills", state: "Michigan", capacity: 21231, date_opened: Date.new(1988, 8, 13), image_url: "http://www.gannett-cdn.com/-mm-/4463c0bcddb3c66da854f6f6d9b3497ce869ee3f/c=132-28-1993-1427&r=x404&c=534x401/local/-/media/2015/10/23/DetroitFreePress/DetroitFreePress/635812250816528195-USATSI-8849124-115794393-lowres.jpg")

Place.create!(name: "Time Warner Cable Arena", description: "Home of the Charlotte Hornets", address: "333 East Trade Street", city: "Charlotte", state: "North Carolina", capacity: 19077, date_opened: Date.new(2005, 10, 21), image_url: "http://d1ya1fm0bicxg1.cloudfront.net/14-08172012-502ea0fd24514.jpeg")

Place.create!(name: "Toyota Center", description: "Home of the Houston Rockets", address: "1510 Polk Street", city: "Houston", state: "Texas", capacity: 18055, date_opened: Date.new(2003, 10, 6), image_url: "http://stadiumparkingguides.com/wp-content/uploads/2014/12/021_toyota_center.jpg")

Place.create!(name: "United Center", description: "Home of the Chicago Bulls", address: "1901 West Madison Street", city: "Chicago", state: "Illinois", capacity: 20917, date_opened: Date.new(1994, 8, 18), image_url: "https://cbschicago.files.wordpress.com/2010/09/united-center-feature1.jpg")

Place.create!(name: "Verizon Center", description: "Home of the Washington Wizards", address: "601 F Street Northwest", city: "Washington", state: "D.C.", capacity: 20356, date_opened: Date.new(1997, 12, 2), image_url: "https://seatgeek.com/tba/wp-content/uploads/2013/03/verizon-center-58079-e1404248139645.jpg")

Place.create!(name: "Vivint Smart Home Arena", description: "Home of the Utah Jazz", address: "301 West South Temple", city: "Salt Lake City", state: "Utah", capacity: 19911, date_opened: Date.new(1991, 10, 4), image_url: "http://images.vivintcdn.com/global/vivint.com/sections/jazz/smartHomeArena-article-v2.jpg")

Place.create!(name: "Wells Fargo Center", description: "Home of the Philadelphia 76ers", address: "3601 South Broad Street", city: "Philadelphia", state: "Pennsylvania", capacity: 21600, date_opened: Date.new(1996, 8, 13), image_url: "http://www1.pictures.zimbio.com/gi/Edmonton+Oilers+v+Philadelphia+Flyers+iSDNGzDaEaal.jpg")
