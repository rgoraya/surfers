class RegistrationEmail < MailForm::Base
  attribute :team,          :validate => true
  attribute :team_manager,  :validate => true
  attribute :team_captain,  :validate => true
  attribute :tournament,    :validate => true
  attribute :registration,  :validate => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
        :subject => %(Registration request for Surfer's #{tournament.name}),
        :to => "ramindersingh.goraya@gmail.com",
        :from => %("#{team_manager.name}" <#{team_manager.email}>)
    }
  end
end