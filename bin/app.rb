require 'sinatra/base'
require 'json'
require 'pg'
require 'georuby'






class App < Sinatra::Base
	

	enable :sessions

	set :port, 8080
	set :static, true
	set :public_folder, "static"
	set :views, "views"
	set :show_exceptions, false
	set :raise_errors, true



	def with_db
		db = PG.connect(
			dbname:'zones',
			user:'zoneme',
			password: '')

		begin
			yield db

		ensure
			db.close
		end
	end

	def make_geom_point(lng, lat)
		point = GeoRuby::SimpleFeatures::Point
		station_point = point.from_x_y(lng, lat)
	end

	

	get '/'  do
		erb :index	
	end

	get '/zone' do
		@zones = session[:zones]
		erb :zone
	end


		
	get '/api/v1/zones/stations/:station?' do
		content_type :json
		#returns zone, lat & long
		headers "Access-Control-Allow-Origin" => "*"
		
		with_db do |db|
			sql = 'SELECT stations.zone FROM public.stations WHERE stations.station=$1'
			results = db.exec_params(sql, [params['station']])
			results.values().to_s
		end
		
		
		
	end

	

	get '/api/v1/zones/location/?' do
		#returns zone, station and distance_to
		#status 200
		content_type :json
		headers "Access-Control-Allow-Origin" => "*"
		lng = params['lng']
		lat = params['lat']
		geom_point = make_geom_point(lng, lat)
		geom_point = geom_point.as_hex_ewkb



		with_db do |db|
			sql = 'SELECT st.station, st.zone, ST_Distance(st.geom, $1) * 69.00 as distance
					FROM stations st
					WHERE ST_DWithin(st.geom, $1, 1/69.00)
					ORDER BY distance ASC LIMIT 3;'
			results = db.exec_params(sql, [geom_point])
			@zones = results.values()
			session[:zones] = @zones
			redirect to('/zone') #@zones
		end

		

		

	end

	
end

