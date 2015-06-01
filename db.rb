require 'pg'

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


with_db do |db|
	
	results = db.query('SELECT london_stations.station, london_stations.zone FROM public.london_stations WHERE london_stations.station=$1', ['Tulse Hill'])
	puts results.values()
end