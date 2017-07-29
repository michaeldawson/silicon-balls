Clearance.configure do |config|
  config.allow_sign_up = false
  config.mailer_sender = "hello@siliconballs.com"
  config.rotate_csrf_on_sign_in = true
end
