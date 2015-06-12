require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/'  do
	return 'Hello, welcome to TFL ZONESZZZZZZZZZ'	
end
	
get '/api/v1/zones/stations/:station' do
	status 200
	headers \
	"Access-Control-Allow-Origin" => "*"

	station = params[:station]

	erb :station, :locals => {'station' => station, 'zone' => "3"}
end

get '/api/v1/zone/' do
	status 200
	headers \
	"Access-Control-Allow-Origin" => "*"

	longitude = params['lng'] || "got browser location"
	latitude = params['lat'] || "got browser location"

	erb :index, :locals => {'longitude' => longitude, 'latitude' => latitude}

end