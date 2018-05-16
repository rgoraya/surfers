class Add2018TournamentToTournaments < ActiveRecord::Migration
  def self.up
    tournament_hash = {
        :slug => "annual-tournament-2018",
        :start_time => "June 30, 2018".to_datetime,
        :end_time => "July 1, 2018".to_datetime,
        :name => "13th annual Field Hockey tournament",
        :location => "Arena Soccer Park of Orange, 2190 North Canal Street, Orange, CA 92865",
        :registration_deadline => "June 29, 2018".to_datetime
    }
    Tournament.create!(tournament_hash)

  end

  def self.down
    Tournament.find_by_slug("annual-tournament-2018").andand.destroy
  end

end
