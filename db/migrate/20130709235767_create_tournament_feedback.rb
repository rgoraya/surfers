class CreateTournamentFeedback < ActiveRecord::Migration
  def self.up
    create_table :tournament_feedbacks do |t|
      t.string  :team_name     , :null => false
      t.string  :captain_name
      t.string  :manager_name
      t.integer :management_score
      t.integer :umpiring_score
      t.integer :competition_level_score
      t.text    :suggestion
      t.timestamps
    end

  end

  def self.down
    drop_table :tournament_feedbacks
  end

end