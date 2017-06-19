class Tournament < ActiveRecord::Base
  attr_accessible :slug, :start_time, :end_time, :name, :location, :description, :registration_deadline

  has_many :tournament_registrations, :order => "created_at DESC"
  has_many :teams, :through => :tournament_registrations, :readonly => false

  has_many :tournament_divisions
  has_many :divisions, :through => :tournament_divisions, :readonly => false
  
end