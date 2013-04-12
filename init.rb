#!/usr/bin/env ruby
# init.rb : set up $LOAD_PATH and provide an easy accessor

module RackSkeleton
    class Settings
        @@root_dir = File.dirname(__FILE__)

        def self.root_dir
            @@root_dir
        end
    end
end

$LOAD_PATH << RackSkeleton::Settings.root_dir
