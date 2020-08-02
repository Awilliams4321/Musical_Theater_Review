# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
apikey = "AASuppw2AusY2e7kVgGpVxZQGT0LvQUu"

# z = HTTParty.get("https://app.ticketmaster.com/discovery/v2/classifications.json?apikey=#{apikey}")
# band = HTTParty.get("https://app.ticketmaster.com/discovery/v2/classifications/KZFzBErXgnZfZ7vA71?.json?apikey=#{apikey}")
# x = HTTParty.get("https://app.ticketmaster.com/discovery/v2/classifications/KZFzBErXgnZfZ7vA71.json?apikey=AASuppw2AusY2e7kVgGpVxZQGT0LvQUu")
# choir = HTTParty.get("https://app.ticketmaster.com/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vA7a?locale=en-us&apikey=#{apikey}")
#c = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?/classificationId=/KZFzBErXgnZfZ7vA7a&apikey=AASuppw2AusY2e7kVgGpVxZQGT0LvQUu")
# page = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?subGenreId=KZFzBErXgnZfZ7vA7a&apikey=#{apikey}") 
# page_events = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?page=20&apikey=#{apikey}")
# m_page = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?subGenreId=KZazBEonSMnZfZ7vAve&postalCode=80016&apikey=#{apikey}") 
# cl = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?postalCode=80016&apikey=#{apikey}") 
v = HTTParty.get("https://app.ticketmaster.com/discovery/v2/venues.json?apikey=#{apikey}&keyword=paramount&postalCode=80202") 
co_events = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?apikey=#{apikey}&city=denver") 
https://app.ticketmaster.com/discovery/v2/events.json?apikey=AASuppw2AusY2e7kVgGpVxZQGT0LvQUu&city=denver




# /categories?lang&domain&category_id&subcategories
binding.pry

# [{:id=>"KZFzBErXgnZfZ7vA71",
#   :name=>"Band",
#   :link=>"/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vA71?locale=en-us"},
#  {:id=>"KZFzBErXgnZfZ7vA7a",
#   :name=>"Choir",
#   :link=>"/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vA7a?locale=en-us"},
#  {:id=>"KZFzBErXgnZfZ7vA7F",
#   :name=>"Chorus",
#   :link=>"/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vA7F?locale=en-us"},
#  {:id=>"KZFzBErXgnZfZ7vA76",
#   :name=>"Group",
#   :link=>"/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vA76?locale=en-us"},
#  {:id=>"KZFzBErXgnZfZ7vA7k",
#   :name=>"League",
#   :link=>"/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vA7k?locale=en-us"},
#  {:id=>"KZFzBErXgnZfZ7vA7A",
#   :name=>"Orchestra",
#   :link=>"/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vA7A?locale=en-us"},
#  {:id=>"KZFzBErXgnZfZ7vA77",
#   :name=>"Quartet",
#   :link=>"/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vA77?locale=en-us"},
#  {:id=>"KZFzBErXgnZfZ7vA7d",
#   :name=>"Team",
#   :link=>"/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vA7d?locale=en-us"},
#  {:id=>"KZFzBErXgnZfZ7vAAI",
#   :name=>"Tribute Band",
#   :link=>"/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vAAI?locale=en-us"},
#  {:id=>"KZFzBErXgnZfZ7vA7e",
#   :name=>"Troupe",
#   :link=>"/discovery/v2/classifications/subtypes/KZFzBErXgnZfZ7vA7e?locale=en-us"}]

# arr = x[:categories].map{|hash| hash.name}
# [{"name"=>"Musicals",
#   "locale"=>"en-us",
#   "level"=>2,
#   "_links"=>
#    {"self"=>{"href"=>"/discovery/v1/categories/207?locale=en-us&domain=ticketmaster.com"},
#     "parent"=>
#      {"href"=>"/discovery/v1/categories/10002?locale=en-us&domain=ticketmaster.com"}},
#   "id"=>"207",
#   "type"=>"category"}]
