# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
NkuProject::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address              => 'smtp-mail.outlook.com',
  :port                 => '587',
  :user_name            => ENV.fetch("OUTLOOK_USER"),
  :password             => ENV.fetch("OUTLOOK_PASS"),
  :domain               => 'outlook.com',
  :authentication       => :login,
  :ssl                  => true,
  :openssl_verify_mode  => 'none'
  :enable_starttls_auto => true
}