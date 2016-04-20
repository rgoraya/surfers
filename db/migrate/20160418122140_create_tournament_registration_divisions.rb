class CreateTournamentRegistrationDivisions < ActiveRecord::Migration
  def self.up
    if !table_exists?(:tournament_registration_divisions)
      create_table :tournament_registration_divisions do |t|
        t.integer :division_id
        t.integer :tournament_registration_id
        t.timestamps
      end
    end
  end

  def self.down
    if table_exists?(:tournament_registration_divisions)
      drop_table :tournament_registration_divisions
    end
  end

end
