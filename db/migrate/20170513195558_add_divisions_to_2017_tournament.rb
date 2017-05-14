class AddDivisionsTo2017Tournament < ActiveRecord::Migration
  def self.up
    if tournament = Tournament.find_by_slug("annual-6-x-6-tournament-2017")
      Division.all.each do |division|
        TournamentDivision.create(
            :division_id => division.id,
            :tournament_id => tournament.id
        )
      end
    end
  end

  def self.down

  end

end