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

	def test_get_zone
		get '/api/v1/zone', params={:lng => -0.11, :lat => 51.54}
		assert last_response.status.must_equal 200
		assert_equal '*', last_response.headers['Access-Control-Allow-Origin']
		assert last_response.body.include?('Zone 3')
	end

	
	
end	