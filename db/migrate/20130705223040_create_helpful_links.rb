class CreateHelpfulLinks < ActiveRecord::Migration
  def self.up
    create_table :helpful_links do |t|
      t.string :link_text, :null => false
      t.string :link_href,  :null => false
      t.timestamps
    end

    link_data.each do |link|
      HelpfulLink.create(link)
    end
  end

  def self.down
    drop_table :helpful_links
  end

  def self.link_data
    [
        {
            :link_text => "USA Field hockey",
            :link_href => "http://www.teamusa.org/USA-Field-Hockey.aspx"
        },
        {
            :link_text => "International Hockey Federation",
            :link_href => "http://www.fih.ch/en/home"
        },
        {
            :link_text => "Field hockey rules",
            :link_href => "http://www.essortment.com/field-hockey-game-rules-58939.html"
        },
        {
            :link_text => "FHF - Field Hockey Federation",
            :link_href => "http://www.socalfieldhockey.com/"
        },
        {
            :link_text => "Hockey News",
            :link_href => "http://www.fieldhockey.com/"
        }
    ]
  end
end