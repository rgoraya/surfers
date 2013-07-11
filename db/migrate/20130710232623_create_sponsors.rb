class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :link_text, :null => false
      t.string :link_href,  :null => false
      t.timestamps
    end

    link_data.each do |link|
      Sponsor.create(link)
    end
  end

  def self.down
    drop_table :sponsors
  end

  def self.link_data
    [
        {
            :link_text => "Gill Electric Inc.",
            :link_href => "http://www.gillelectric.com/"
        },
        {
            :link_text => "Peacock Gardens",
            :link_href => "http://peacockgardensindian.com"
        },
        {
            :link_text => "Shivbir S Grewal",
            :link_href => "http://www.sycr.com/Shivbir-S-Grewal"
        }
    ]
  end
end