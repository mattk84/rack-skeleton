
module RackSkeleton
  class GameModel
    @@choices = %w{rock paper scissors}
    @@win_table = {
      'rock' => 'scissors',
      'scissors' => 'paper',
      'paper' => 'rock',
    }
    
    #'win' means user win
    def self.determine_outcome(user_choice, ai_choice)
      u = user_choice.downcase
      a = ai_choice.downcase
      
      return 'tie' if u == a
      if @@win_table.has_key?(u)
        return 'win' if @@win_table[u] == a
        return 'lose'
      else
        return 'dont_get_fancy'
      end    
    end

    def self.make_ai_choice
      @@choices.sample
    end
  end
end