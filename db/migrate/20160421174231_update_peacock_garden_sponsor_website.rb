class UpdatePeacockGardenSponsorWebsite < ActiveRecord::Migration
  def self.up

    pg = Sponsor.find_by_link_text("Peacock Gardens")

    if pg
      pg.update_attributes(:link_href => "http://www.peacockdiamondbar.com")
      pg.save
    end

  end

  def self.down
  end

end