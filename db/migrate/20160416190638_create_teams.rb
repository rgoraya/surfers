class CreateTeams < ActiveRecord::Migration
  def self.up
    if !table_exists?(:teams)
      create_table :teams do |t|
        t.text :name, :null => false
        t.string  :uniform_color
        t.timestamps
      end
    end

  end

  def self.down
    if table_exists?(:teams)
      drop_table :teams
    end
  end

end
