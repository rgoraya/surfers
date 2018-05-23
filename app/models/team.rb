class Team < ActiveRecord::Base
  attr_accessible :name, :uniform_color

  has_one :team_captain
  has_one :team_manager
  has_one :team_voluntary_umpire

  has_many :team_players

  has_one  :tournament_registration
  has_one  :tournament, :through => :tournament_registration, :readonly => false

  validates_presence_of :name
  #validates_uniqueness_of :name

end