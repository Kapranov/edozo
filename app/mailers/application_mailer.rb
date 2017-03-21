class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.mailer_default
  layout 'mailer'
end
