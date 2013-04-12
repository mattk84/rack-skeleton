#!/usr/bin/env ruby
# superclass of all routes to allow us to DRY up our code.
require 'sinatra/base'

module RackSkeleton
    class BaseRoute < Sinatra::Base
        # define some common "before" / "configure" settings, etc.
        configure do
            set :root, Settings.root_dir
        end
    end
end
