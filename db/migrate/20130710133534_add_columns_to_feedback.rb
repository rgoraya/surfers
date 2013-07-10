class AddColumnsToFeedback < ActiveRecord::Migration
  def self.up
    add_column :tournament_feedbacks, :will_play_again, :boolean
    add_column :tournament_feedbacks, :will_recommend, :boolean
  end

  def self.down
  end

end