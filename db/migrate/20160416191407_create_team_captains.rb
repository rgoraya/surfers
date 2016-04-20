class CreateTeamCaptains < ActiveRecord::Migration
  def self.up
    if !table_exists?(:team_captains)
      create_table :team_captains do |t|
        t.string  :name, :null => false
        t.string  :phone_number
        t.integer :team_id
        t.timestamps
      end
    end

  end

  def self.down
    if table_exists?(:team_captains)
      drop_table :team_captains
    end
  end

end
