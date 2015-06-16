require 'sinatra'
require 'sinatra/param'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"



get '/'  do
	erb :index	
end


	
get '/api/v1/zones/stations/:station' do
	#returns zone, lat & long
	param :station,    String, required: true, raise: true
	#status 200
	headers "Access-Control-Allow-Origin" => "*"

	

	
end

get '/api/v1/zones/location' do
	#returns zone, station and distance_to
	status 200
	headers "Access-Control-Allow-Origin" => "*"

end

