require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/'  do
	return 'Hello, welcome to TFL ZONESZZZZZZZZZ'	
end
	

get '/location/' do
	longitude = params['lng'] || "got browser location"
	latitude = params['lat'] || "got browser location"
	erb :index, :locals => {'longitude' => longitude, 'latitude' => latitude}
end

post '/api/v1/location/' do

	longitude = params['lng'] || "got browser location"
	latitude = params['lat'] || "got browser location"

	erb :index, :locals => {'longitude' => longitude, 'latitude' => latitude}

end

get '/api/v1/zone' do

end