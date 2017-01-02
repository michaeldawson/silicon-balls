class ApplicationMailer < ActionMailer::Base
  default to: ENV['NOTIFICATION_EMAIL']
  default from: 'no-reply@siliconballs.com'
  layout 'mailer'
end
