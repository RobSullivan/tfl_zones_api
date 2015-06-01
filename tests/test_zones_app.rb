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
		assert_equal 'Hello world', last_response.body
	end

	def test_location
		get '/location'
		assert last_response.ok?
		assert last_response.body.include?('you are at Latitude: got browser location, longitude: got browser location.')
	end
	
	def test_location_post
		post '/location/', params={:lng => 2, :lat => 1}
		assert last_response.ok?
		assert last_response.body.include?('Zone 1')
	end
end	