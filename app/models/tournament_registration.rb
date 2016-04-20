class TournamentRegistration < ActiveRecord::Base

  attr_accessible :tournament_id, :team_id

  belongs_to  :tournament
  belongs_to  :team

  has_many :tournament_registration_divisions
  has_many :divisions, :through => :tournament_registration_divisions, :readonly => false

end