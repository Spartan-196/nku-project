# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
NkuProject::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => 'sendgird_username',
  :password       => 'sendgrid_pass',
  :domain         => 'example.com',
  :enable_starttls_auto => true
}