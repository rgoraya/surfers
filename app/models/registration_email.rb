class RegistrationEmail < MailForm::Base
  attribute :team,                      :validate => true
  attribute :team_manager_name,         :validate => true
  attribute :team_captain_name,         :validate => true
  attribute :team_manager_phone_number, :validate => true
  attribute :team_captain_phone_number, :validate => true
  attribute :team_manager_email,        :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :tournament_name,           :validate => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
        :subject => %(Registration request for #{tournament_name}),
        :to => "ramindersingh.goraya@gmail.com",
        :from => %("#{team_manager_name}" <#{team_manager_email}>)
    }
  end
end