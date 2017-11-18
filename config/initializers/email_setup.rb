ActionMailer::Base.default_url_options = { host: ENV['FOGGLY_HOST'] }
ActionMailer::Base.delivery_method = :smtp
# SMTP settings for gmail
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  user_name: ENV['GMAIL_USERNAME'],
  password: ENV['GMAIL_PASSWORD'],
  authentication: 'plain',
  enable_starttls_auto: true
}
