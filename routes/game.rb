#!/usr/bin/env ruby
#
require 'routes/base'

module RackSkeleton
  class GameRoute < BaseRoute
    get '/' do
      erb :game
    end
    
    get '/:choice' do |user_choice|
      ai_choice = 'rock' #my_ai_strategy.choose()
      outcome = 'win' #determine_outcome(user_choice, ai_choice)
      erb :final, :locals => { :user_choice => user_choice, :ai_choice => ai_choice, :outcome => outcome }
    end
  end
end
