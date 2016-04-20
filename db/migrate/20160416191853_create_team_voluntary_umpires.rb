class CreateTeamVoluntaryUmpires < ActiveRecord::Migration
  def self.up
    if !table_exists?(:team_voluntary_umpires)
      create_table :team_voluntary_umpires do |t|
        t.string  :name, :null => false
        t.string  :phone_number
        t.integer :team_id
        t.timestamps
      end
    end

  end

  def self.down
    if table_exists?(:team_voluntary_umpires)
      drop_table :team_voluntary_umpires
    end
  end

end
