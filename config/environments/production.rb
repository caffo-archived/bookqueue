# Settings specified here will take precedence over those in config/environment.rb

# The production environment is meant for finished, "live" apps.
# Code is not reloaded between requests
config.cache_classes = true

# Use a different logger for distributed setups
# config.logger = SyslogLogger.new

# Full error reports are disabled and caching is turned on
config.action_controller.consider_all_requests_local = false
config.action_controller.perform_caching             = true
config.action_view.cache_template_loading            = true

# Use a different cache store in production
# config.cache_store = :mem_cache_store

# Enable serving of images, stylesheets, and javascripts from an asset server
# config.action_controller.asset_host                  = "http://assets.example.com"

# Disable delivery errors, bad email addresses will be ignored
# config.action_mailer.raise_delivery_errors = false

# bookqueue 
configatron.bookqueue.url   = "http://lolxenuqueue.com/"
configatron.bookqueue.title = "Welcome to xenu's bookqueue. Feel free to change this message in <em>config/environments/production.rb</em>"
configatron.bookqueue.logo  = "http://flexcode-apps.s3.amazonaws.com/bookqueue/logo.gif"

# owner
configatron.owner.name   = "xenu"
configatron.owner.email  = "xenu@xenucorp.com"

# twitter
configatron.twitter.use      = true
configatron.twitter.login     = "xenuqueue"
configatron.twitter.password  = "xenu21"
