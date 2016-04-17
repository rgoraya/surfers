class ExpandTournamentsTable < ActiveRecord::Migration
  def self.up
    if !table_exists?(:tournaments)
      create_table :tournaments do |t|
        t.string :slug, :null => false
        t.timestamps
      end
    end

    add_column :tournaments, :name, :text
    add_column :tournaments, :description, :text
    add_column :tournaments, :start_time, :datetime
    add_column :tournaments, :end_time, :datetime
    add_column :tournaments, :location, :text

    Tournament.reset_column_information

    existing_tournament_data.each do |tournament|
      if existing_tournament = Tournament.find_by_slug(tournament[:slug])
        existing_tournament.start_time = tournament[:start_time]
        existing_tournament.end_time = tournament[:end_time]
        existing_tournament.name = tournament[:name]
        existing_tournament.location = tournament[:location]
        existing_tournament.save
      else
        Tournament.create!(tournament)
      end
    end

  end

  def self.down
    remove_column :tournaments, :name
    remove_column :tournaments, :description
    remove_column :tournaments, :start_time
    remove_column :tournaments, :end_time
    remove_column :tournaments, :location
  end

  def self.existing_tournament_data
    [
        {
           :slug => "annual-6-x-6-tournament-2013",
           :start_time => "July 6, 2013".to_datetime,
           :end_time => "July 7, 2013".to_datetime,
           :name => "8th annual 6x6 Surfers Field Hockey tournament",
           :location => "Arena Soccer Park of Orange, 2190 North Canal Street, Orange, CA 92865"
        },
        {
           :slug => "annual-6-x-6-tournament-2014",
           :start_time => "April 26, 2014".to_datetime,
           :end_time => "April 27, 2014".to_datetime,
           :name => "9th annual 6x6 Surfers Field Hockey tournament",
           :location => "Arena Soccer Park of Orange, 2190 North Canal Street, Orange, CA 92865"
        },
        {
            :slug => "annual-6-x-6-tournament-2015",
            :start_time => "July 11, 2015".to_datetime,
            :end_time => "July 12, 2015".to_datetime,
            :name => "10th annual 6x6 Surfers Field Hockey tournament",
            :location => "Arena Soccer Park of Orange, 2190 North Canal Street, Orange, CA 92865"
        },
        {
            :slug => "annual-6-x-6-tournament-2016",
            :start_time => "June 25, 2016".to_datetime,
            :end_time => "June 26, 2016".to_datetime,
            :name => "11th annual Field Hockey tournament",
            :location => "Arena Soccer Park of Orange, 2190 North Canal Street, Orange, CA 92865"
        }


    ]
  end

end