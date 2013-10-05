#!/usr/bin/env ruby
# init.rb : set up $LOAD_PATH and provide an easy accessor
# Additionally, use the 'app.yml' file to fill in any variables in ENV
#
require 'yaml'

module RackSkeleton
    class Settings
        @@root_dir = File.dirname(__FILE__)
        default_basename = 'app.yml'
        @@config_file = ENV['CONFIG_YML'] || File.join(@@root_dir, default_basename)

        def self.root_dir
            @@root_dir
        end

        def self.fill_in_env
            return unless File.exists?(@@config_file)

            y = YAML.load(File.open(@@config_file)) rescue nil

            return unless y

            y.each do |k, v|
                ENV[k.to_s] ||= v
            end
        end
    end
end

$LOAD_PATH << RackSkeleton::Settings.root_dir
RackSkeleton::Settings.fill_in_env
