class TournamentRegistrationDivision < ActiveRecord::Base

  belongs_to  :tournament_registration
  belongs_to  :division

end