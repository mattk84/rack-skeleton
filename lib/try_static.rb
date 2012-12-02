# Standalone version of Ryan Tomayko's TryStatic, originally part of Rack-Contrib gem.
# https://github.com/rack/rack-contrib/blob/master/lib/rack/contrib/try_static.rb
# License: https://github.com/rack/rack-contrib/blob/master/COPYING
module Rack

  class TryStatic

    def initialize(app, options)
      @app = app
      @try = ['', *options.delete(:try)]
      @static = ::Rack::Static.new(lambda { [404, {}, []] }, options)
    end

    def call(env)
      orig_path = env['PATH_INFO']
      found = nil
      @try.each do |path|
        resp = @static.call(env.merge!({'PATH_INFO' => orig_path + path}))
        break if 404 != resp[0] && found = resp
      end
      found or @app.call(env.merge!('PATH_INFO' => orig_path))
    end
  end
end
