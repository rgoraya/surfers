class CreateDivisions < ActiveRecord::Migration
  def self.up
    if !table_exists?(:divisions)
      create_table :divisions do |t|
        t.string  :name
        t.integer :fee
        t.timestamps
      end
    end

    Division.reset_column_information

    divisions_data.each do |division|
      Division.create(division)
    end

  end

  def self.down
    if table_exists?(:divisions)
      drop_table :divisions
    end
  end

  def self.divisions_data
    [
        { :name => "Competitive", :fee => 350 },
        { :name => "Social"     , :fee => 350 }
    ]
  end

end
