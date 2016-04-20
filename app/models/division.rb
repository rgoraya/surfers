class Division < ActiveRecord::Base
  attr_accessible :name, :fee

  has_many  :tournament_divisions
  has_many  :tournaments, :through => :tournament_divisions, :readonly => false

  has_many  :tournament_registration_divisions
  has_many  :tournament_registrations, :through => :tournament_registration_divisions, :readonly => false

end