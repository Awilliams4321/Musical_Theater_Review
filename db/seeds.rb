# co_venues = HTTParty.get("https://app.ticketmaster.com/discovery/v2/venues.json?apikey=AASuppw2AusY2e7kVgGpVxZQGT0LvQUu&locale=en-us&stateCode=CO&countryCode=US") 

# co_venues_ids = []

# vens = []
# co_venues["_embedded"]["venues"].each{|h| vens << {name: h["name"], api_id: h["id"], browser_url: h["url"]} }

# #v_hash represents the #=> 
# # {:name=>"Avalon Theatre",
# #   :api_id=>"KovZpa4gke",
# #   :bro_url=>"https://www.ticketmaster.com/avalon-theatre-tickets-grand-junction/venue/246458"}

# #hash, hits the API, 
# api_data = {}

# vens.each do |v_hash| #v_hash represents the hash, taking the api key value which rep. the venue in ticket master api, 
#    response = HTTParty.get("https://app.ticketmaster.com/discovery/v2/events.json?apikey=AASuppw2AusY2e7kVgGpVxZQGT0LvQUu&venueId=#{v_hash[:api_id]}")
#    ven_events = response["_embedded"]["events"].map{|hash| {event_name: hash["name"], browser_url: hash["url"], 
#    description: hash["info"], api_class: hash["classifications"], venue: v_hash[:name]}}
#    api_data[v_hash[:name]] = ven_events #Ex: 'Coors Fields': [{event_info}, {event_info}, etc.}]
# end

# arts_n_theatre = api_data.values.delete_if do |arr_h| 
#    arr_h[0][:api_class].nil? 
# end.select do |arr_h|
#     arr_h if arr_h[0][:api_class].first["segment"]["name"] == 'Arts & Theatre'
# end.flatten

#  binding.pry

# # https://app.ticketmaster.com/discovery/v2/events.json?apikey=AASuppw2AusY2e7kVgGpVxZQGT0LvQUu&venueId=KovZpa4gke

# # name, url, info, classifications

# Musical.create(name: "Hamilton", city: "Denver,CO", info: "Alexander Hamilton Biography")
Musical.create(name: "My Fair Lady", city: "Denver,CO", info: "Throwback to 90's songs.")