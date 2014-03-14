class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|
      t.string :slug, :null => false
      t.timestamps
    end

    #tournament_data.each do |t|
    #  Tournament.create(t)
    #end
  end

  def self.down
    drop_table :tournaments
  end

  def self.tournament_data
    [
        {
            :slug => "annual-6-x-6-tournament-2013"
        },
        {
            :slug => "annual-6-x-6-tournament-2014"
        }
    ]
  end
end