class RegistrationEmail < MailForm::Base
  attribute :team,          :validate => true
  attribute :team_manager,  :validate => true
  attribute :team_captain,  :validate => true
  attribute :tournament,    :validate => true
  attribute :registration,  :validate => true
  attribute :type,          :validate => ["Notification", "Confirmation"]

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    if type == "Confirmation"
      {
          :subject => %(Registration confirmation for Surfer's #{tournament.name}) ,
          :to => "#{team_manager.email}",
          :from => %("Surfers Field Hockey Club" <hbsurfers@hotmail.com>)
      }
    elsif type == "Notification"
      {
          :subject => %(Registration request for Surfer's #{tournament.name}) ,
          :to => "hbsurfers@hotmail.com, riaz325@yahoo.com",
          :bcc => "ramindersingh.goraya@gmail.com",
          :from => %("#{team_manager.name}" <#{team_manager.email}>)
      }
    end
  end
end