require 'sinatra/base'
require 'sinatra/param'
require 'json'




class App < Sinatra::Base
	helpers Sinatra::Param


	set :port, 8080
	set :static, true
	set :public_folder, "static"
	set :views, "views"
	set :show_exceptions, false
	set :raise_errors, true


	before do
		content_type :json
	end

	get '/'  do
		erb :index	
	end


		
	get '/api/v1/zones/stations/:station' do
		#returns zone, lat & long
		param :station, String, required: true
		
		headers "Access-Control-Allow-Origin" => "*"
		
	end

	

	get '/api/v1/zones/location' do
		#returns zone, station and distance_to
		#status 200
		headers "Access-Control-Allow-Origin" => "*"

	end

	
end

