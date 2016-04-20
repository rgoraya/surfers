class CreateTournamentDivisions < ActiveRecord::Migration
  def self.up
    if !table_exists?(:tournament_divisions)
      create_table :tournament_divisions do |t|
        t.integer :division_id
        t.integer :tournament_id
        t.timestamps
      end
    end

    Tournament.all.each do |tournament|
      Division.all.each do |division|
        TournamentDivision.create(
            :division_id => division.id,
            :tournament_id => tournament.id
        )
      end

    end

  end

  def self.down
    if table_exists?(:tournament_divisions)
      drop_table :tournament_divisions
    end
  end

end
