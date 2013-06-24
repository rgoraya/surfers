class TeamMember < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :position, :image_slug
end