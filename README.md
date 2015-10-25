# TFL Zones API

An API that returns the zone of a station on the TFL map. 

Accepts station name or station longitude and latitude.

Developed on a Windows machine.


### Database

Postgres with PostGis extension
[Station data](https://github.com/RobSullivan/cycle-save)

### App

A Sinatra client


Update db username and password in app.rb


Start database server

`rake test`