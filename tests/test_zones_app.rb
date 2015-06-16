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
		get '/api/v1/zones/location', params={:lng => -0.11, :lat => 51.54}
	 	assert last_response.ok?
		assert_equal '*', last_response.headers['Access-Control-Allow-Origin']
	 	
	 end

	def test_get_zone_by_station
		get '/api/v1/zones/stations/:station', :station => "Tulse Hill"
		assert last_response.ok?
		assert_equal '*', last_response.headers['Access-Control-Allow-Origin']
		
	end

	def test_validate_string_param
		get '/api/v1/zones/stations/:station', :station => "Northwood Hills"
		assert_equal "Northwood Hills", last_request.params["station"]
		assert last_request.params["station"].is_a?(String)

	end

	def test_pass_non_string_param
		get '/api/v1/zones/stations/:station', :station => 2
		assert_equal last_response.status, 400
	end

	
	
end	