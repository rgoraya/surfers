class AddRegistrationDeadlineToTournaments < ActiveRecord::Migration
  def self.up
    add_column :tournaments, :registration_deadline, :datetime

    Tournament.reset_column_information

    existing_tournament_data.each do |tournament|
      if existing_tournament = Tournament.find_by_slug(tournament[:slug])
        existing_tournament.registration_deadline = tournament[:registration_deadline]
        existing_tournament.save
      end
    end

  end

  def self.down
    remove_column :tournaments, :registration_deadline
  end

  def self.existing_tournament_data
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