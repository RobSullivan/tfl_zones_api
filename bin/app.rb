require 'sinatra/base'
require 'json'




class App < Sinatra::Base
	


	set :port, 8080
	set :static, true
	set :public_folder, "static"
	set :views, "views"
	set :show_exceptions, false
	set :raise_errors, true


	

	get '/'  do
		erb :index	
	end


		
	get '/api/v1/zones/stations/:station' do
		content_type :json
		#returns zone, lat & long
		headers "Access-Control-Allow-Origin" => "*"
		station = params['station']
		
		"6"
	end

	

	get '/api/v1/zones/location/?' do
		#returns zone, station and distance_to
		#status 200
		content_type :json
		headers "Access-Control-Allow-Origin" => "*"
		longitude = params['lng']
		latitude = params['lat']
		
		"3"
		

	end

	
end

