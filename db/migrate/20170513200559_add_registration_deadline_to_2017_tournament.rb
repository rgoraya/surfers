class AddRegistrationDeadlineTo2017Tournament < ActiveRecord::Migration
  def self.up
    if tournament = Tournament.find_by_slug("annual-6-x-6-tournament-2017")
      tournament.update_attributes(:registration_deadline => "June 23, 2017".to_datetime,)
      tournament.save
    end

  end

  def self.down

  end

end