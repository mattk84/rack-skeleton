#!/usr/bin/env ruby
#
# init.rb : set up $LOAD_PATH and provide an easy accessor

class Settings
    @@root_dir = File.dirname(__FILE__)

    def self.root_dir
        @@root_dir
    end
end

$LOAD_PATH << Settings.root_dir
