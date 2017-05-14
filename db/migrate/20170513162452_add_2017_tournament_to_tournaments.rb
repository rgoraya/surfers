class Add2017TournamentToTournaments < ActiveRecord::Migration
  def self.up
    tournament_hash = {
        :slug => "annual-6-x-6-tournament-2017",
        :start_time => "June 24, 2017".to_datetime,
        :end_time => "June 25, 2017".to_datetime,
        :name => "12th annual Field Hockey tournament",
        :location => "Arena Soccer Park of Orange, 2190 North Canal Street, Orange, CA 92865"
    }
    Tournament.create!(tournament_hash)

  end

  def self.down
    Tournament.find_by_slug("annual-6-x-6-tournament-2017").andand.destroy
  end

end
