require 'sinatra/base'
require 'sinatra/param'




class App < Sinatra::Base
	helpers Sinatra::Param


set :port, 8080
set :static, false
set :public_folder, "static"
set :views, "views"

	get '/'  do
		erb :index	
	end


		
	get '/api/v1/zones/stations/:station' do
		#returns zone, lat & long
		param :station,    String, required: true
		
		headers "Access-Control-Allow-Origin" => "*"
		

		

		
	end

	get '/api/v1/zones/location' do
		#returns zone, station and distance_to
		status 200
		headers "Access-Control-Allow-Origin" => "*"

	end

	run! if app_file ==$0
end

