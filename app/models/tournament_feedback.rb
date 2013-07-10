class TournamentFeedback < ActiveRecord::Base
  attr_accessible :team_name, :manager_name, :captain_name, :management_score, :umpiring_score, :competition_level_score,  :suggestion, :will_recommend, :will_play_again
end