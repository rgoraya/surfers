class CreateTeamMembers < ActiveRecord::Migration
  def self.up
    create_table :team_members do |t|
      t.string :first_name, :null => false
      t.string :last_name,  :null => false
      t.string :position,   :null => false
      t.string :image_slug, :null => false
      t.text   :bio
      t.timestamps
    end

    team_data.each do |member|
      member.merge!(image_slug(member))
      TeamMember.create(member)
    end
  end

  def self.down
    drop_table :team_members
  end

  def self.image_slug(member)
    { :image_slug => "#{member["first_name"]}-#{member["last_name"]}" }
  end
  
  def self.team_data
    [
      {
        :first_name => "Harkirat",
        :last_name => "Guron",
        :position => "Defender"
      },
      {
          :first_name => "Manjot",
          :last_name => "Sandhu",
          :position => "Defender"
      },
      {
        :first_name => "Robinder",
        :last_name => "Aulakh",
        :position => "Goalkeeper"
      }
    ]
  end
end