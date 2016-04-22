class RegistrationEmail < MailForm::Base
  attribute :team,          :validate => true
  attribute :team_manager,  :validate => true
  attribute :team_captain,  :validate => true
  attribute :tournament,    :validate => true
  attribute :registration,  :validate => true
  attribute :confirmation,  :validate => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    if confirmation
      {
          :subject => %(Registration confirmation for Surfer's #{tournament.name}) ,
          :to => "#{team_manager.email}",
          :from => %("Surfers Field Hockey Club" <"hbsurfers@hotmail.com">)
      }
    else
      {
          :subject => %(Registration request for Surfer's #{tournament.name}) ,
          :to => "ramindersingh.goraya@gmail.com",
          :from => %("#{team_manager.name}" <#{team_manager.email}>)
      }
    end
  end
end