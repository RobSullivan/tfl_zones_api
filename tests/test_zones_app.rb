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
		assert_equal 'Hello, welcome to TFL ZONESZZZZZZZZZ', last_response.body
	end

	
	def test_location_post
		post '/api/v1/location/', params={:lng => 2, :lat => 1}
		assert last_response.ok?
		assert_equal '*', last_response.headers['Access-Control-Allow-Origin']
		assert last_response.body.include?('Zone 1')
	end
end	