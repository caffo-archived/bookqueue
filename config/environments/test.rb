# Settings specified here will take precedence over those in config/environment.rb

# The test environment is used exclusively to run your application's
# test suite.  You never need to work with it otherwise.  Remember that
# your test database is "scratch space" for the test suite and is wiped
# and recreated between test runs.  Don't rely on the data there!
config.cache_classes = true

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false

# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false

# Tell Action Mailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the
# ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test

configatron do |config|
  # bookqueue 
  config.namespace(:bookqueue) do |bookqueue|
    bookqueue.url     = "http://lolxenuqueue.com/"
    bookqueue.title   = "Welcome to xenu's bookqueue. Feel free to change this message in <em>config.yml</em>"
  end

  # owner
  config.namespace(:owner) do |owner|
    owner.name   = "xenu"
    owner.email  = "xenu@xenucorp.com"
  end

  # twitter
  config.namespace(:twitter) do |twitter|
    twitter.use       = false
    twitter.login     = "xenuqueue"
    twitter.password  = "xenu21"
  end
end