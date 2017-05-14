class UpdateDivisions < ActiveRecord::Migration
  def self.up

    divisions_data.each do |division|
      if existing_division = Division.find_by_name(division[:name])
        existing_division.name = division[:new_name]
        existing_division.fee  = division[:fee]
        existing_division.save
      else
        Division.create!({:name => division[:name] , :fee => division[:fee]})
      end
    end

  end

  def self.down

  end

  def self.divisions_data
    [
        { :name => "Competitive", :fee => 400, :new_name => "Men/Competition" },
        { :name => "Social"     , :fee => 400, :new_name => "Social/Mixed"  },
        { :name => "Youth"      , :fee => 150, :new_name => "Youth"  }
    ]
  end

end
