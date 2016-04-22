class UpdateTournamentRegistrationDeadlines < ActiveRecord::Migration
  def self.up
    
    tournaments_data.each do |tournament|
      if existing_tournament = Tournament.find_by_slug(tournament[:slug])
        existing_tournament.update_attributes(:registration_deadline => tournament[:registration_deadline])
        existing_tournament.save
      end
    end

  end

  def self.down
  end

  def self.tournaments_data
    [
        {
            :slug => "annual-6-x-6-tournament-2013",
            :registration_deadline => "July 6, 2013".to_datetime
        },
        {
            :slug => "annual-6-x-6-tournament-2014",
            :registration_deadline => "April 26, 2014".to_datetime
        },
        {
            :slug => "annual-6-x-6-tournament-2015",
            :registration_deadline => "July 11, 2015".to_datetime
        },
        {
            :slug => "annual-6-x-6-tournament-2016",
            :registration_deadline => "June 24, 2016".to_datetime
        }
    ]
  end

end