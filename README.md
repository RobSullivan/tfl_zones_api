# Transport For London Station Location API

An API that returns:

1. the nearest TFL station to your location.
2. the zone a station is in


Examples
-         `get '/api/v1/zones/stations/', :station => "Tulse Hill"`
-         `get '/api/v1/zones/location/', params={:lng => -0.11, :lat => 51.54}`


Currently returns a string.




### Database

- Postgres with (PostGIS)[http://postgis.net/] extension

- [Station data](https://github.com/RobSullivan/cycle-save) - Credit to Chris Bell http://www.doogal.co.uk/london_stations.php 

### App

A Sinatra client




### How to install

Developed on a Windows machine.

Update db username and password in app.rb

Bundle install somewhere

### Running the app

Start database server
`command`

Run the tests
`rake test`


Start the application
`bundle exec rackup`
