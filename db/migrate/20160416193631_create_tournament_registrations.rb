class CreateTournamentRegistrations < ActiveRecord::Migration
  def self.up
    if !table_exists?(:tournament_registrations)
      create_table :tournament_registrations do |t|
        t.integer :team_id
        t.integer :tournament_id
        t.timestamps
      end
    end

  end

  def self.down
    if table_exists?(:tournament_registrations)
      drop_table :tournament_registrations
    end
  end

end
