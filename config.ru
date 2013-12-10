#!/usr/bin/env ruby

# load the init file for this app
load File.expand_path('init.rb', File.dirname(__FILE__))

require 'rack'
require 'sinatra/base'

require 'routes/index'
require 'routes/game'

map '/' do
  run RackSkeleton::IndexRoute.new
end

map '/game' do
  run RackSkeleton::GameRoute.new
end

# Run your own Rack app here or use this one to serve 404 messages:
run lambda{ |env| [ 404, { 'Content-Type'  => 'text/html' }, ['404 - page not found'] ] }
