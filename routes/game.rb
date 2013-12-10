#!/usr/bin/env ruby
#
require 'routes/base'
require 'models/game'

module RackSkeleton
  class GameRoute < BaseRoute
    get '/' do
      erb :game
    end
    
    get '/:choice' do |user_choice|
      ai_choice = GameModel.make_ai_choice
      outcome = GameModel.determine_outcome(user_choice, ai_choice)
      erb :final, :locals => { :user_choice => user_choice, :ai_choice => ai_choice, :outcome => outcome }
    end
  end
end
