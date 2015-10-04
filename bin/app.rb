require 'sinatra/base'
require 'json'
require 'pg'





class App < Sinatra::Base
	


	set :port, 8080
	set :static, true
	set :public_folder, "static"
	set :views, "views"
	set :show_exceptions, false
	set :raise_errors, true



	def with_db
		db = PG.connect(
			dbname:'Stations',
			user:'user',
			password: 'password')

		begin
			yield db

		ensure
			db.close
		end
	end

	

	get '/'  do
		erb :index	
	end


		
	get '/api/v1/zones/stations/:station?' do
		content_type :json
		#returns zone, lat & long
		headers "Access-Control-Allow-Origin" => "*"
		
		with_db do |db|
			sql = 'SELECT london_stations.zone FROM public.london_stations WHERE london_stations.station=$1'
			results = db.exec_params(sql, [params['station']])
			results.values().to_s
		end
		
		
		
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

