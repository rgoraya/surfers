class Tournament < ActiveRecord::Base
  attr_accessible :slug, :start_time, :end_time, :name, :location, :description
end