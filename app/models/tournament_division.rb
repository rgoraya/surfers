class TournamentDivision < ActiveRecord::Base

  attr_accessible :division_id, :tournament_id

  belongs_to  :tournament
  belongs_to  :division

end