ENV['RACK_ENV'] = 'test'

require './bin/app.rb'
require 'test/unit'
require 'rack/test'


class MyAppTest < Test::Unit::TestCase
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	def test_my_default
		get '/'
		assert last_response.ok?
	end

	def test_get_zone_by_location
		get '/api/v1/zones/location/', params={:lng => -0.11, :lat => 51.54}
	 	assert last_response.ok?
		assert_equal '*', last_response.headers['Access-Control-Allow-Origin']
	 	
	 end

	def test_get_zone_by_station
		get '/api/v1/zones/stations/:station', :station => "Tulse Hill"
		assert last_response.ok?
		assert_equal '*', last_response.headers['Access-Control-Allow-Origin']
		
	end

	# def test_validate_lat_and_long

	# end

	
	
end	