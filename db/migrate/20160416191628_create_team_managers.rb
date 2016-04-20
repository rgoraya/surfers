class CreateTeamManagers < ActiveRecord::Migration
  def self.up
    if !table_exists?(:team_managers)
      create_table :team_managers do |t|
        t.string  :name, :null => false
        t.string  :phone_number
        t.string  :email
        t.text    :address
        t.integer :team_id
        t.timestamps
      end
    end

  end

  def self.down
    if table_exists?(:team_managers)
      drop_table :team_managers
    end
  end

end
