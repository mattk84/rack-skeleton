#!/usr/bin/env ruby
#
require 'routes/base'

module RackSkeleton
  class IndexRoute < BaseRoute
    get '/' do
      erb :index
    end
  end
end
