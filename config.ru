#!/usr/bin/env ruby

# load the init file for this app
load File.expand_path('init.rb', File.dirname(__FILE__))

require 'rack'
require 'sinatra/base'

require 'lib/try_static'

use Rack::TryStatic, :root => "public", :urls => %w[/], :try => ['.html', 'index.html', '/index.html']

# Run your own Rack app here or use this one to serve 404 messages:
run lambda{ |env| [ 404, { 'Content-Type'  => 'text/html' }, ['404 - page not found'] ] }
