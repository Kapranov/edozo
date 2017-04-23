class TestMailer < ApplicationMailer
  def welcome_email(name)
    @name = name
    mail(to: Rails.application.secrets.mailer_to, subject: Rails.application.secrets.mailer_message)
  end
end
