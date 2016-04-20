class CreateTeamPlayers < ActiveRecord::Migration
  def self.up
    if !table_exists?(:team_players)
      create_table :team_players do |t|
        t.string  :name, :null => false
        t.integer :team_id
        t.timestamps
      end
    end

  end

  def self.down
    if table_exists?(:team_players)
      drop_table :team_players
    end
  end

end
