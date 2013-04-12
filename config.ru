#!/usr/bin/env ruby

# load the init file for this app
load File.expand_path('init.rb', File.dirname(__FILE__))

require 'rack'
require 'sinatra/base'

require 'lib/try_static'

require 'routes/index'

# serve any static files in public/
# the :try section makes the routes greedily look for HTML files.
use Rack::TryStatic, :root => "public", :urls => %w[/], :try => ['.html', 'index.html', '/index.html']

map '/' do
    run RackSkeleton::IndexRoute.new
end

# Run your own Rack app here or use this one to serve 404 messages:
run lambda{ |env| [ 404, { 'Content-Type'  => 'text/html' }, ['404 - page not found'] ] }
