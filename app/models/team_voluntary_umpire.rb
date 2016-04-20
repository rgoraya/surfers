class TeamVoluntaryUmpire < ActiveRecord::Base
  attr_accessible :name, :phone_number, :team_id

  before_validation :remove_phone_number_punctuation
  validates_format_of :phone_number, :with => /\A\d{10}\Z/,
                      :message => "Phone number should have 10 digits",
                      :unless => Proc.new{ |tvu| tvu.phone_number.blank? }

  def remove_phone_number_punctuation
    # Save phone numbers as "xxxxxxxxxx" by removing everything that isn't a digit.
    self.phone_number = self.phone_number.gsub(/[^\d]/, '')
  end

  belongs_to :team

end