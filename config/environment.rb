# ENV['RAILS_ENV'] ||= 'production'

RAILS_GEM_VERSION = '2.1.0' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')
require 'configatron'

Rails::Initializer.run do |config|

# twitter4r comment out because his schizo
# namespace issue. As of right now, install
# twitter4r manually using
#
# gem install twitter4r

  config.gem :rmagick
  config.gem :twitter4r, :lib => 'twitter'
  config.gem :json
  config.gem :configatron
  
  config.time_zone = 'UTC'
  
  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_bookqueue_session',
    :secret      => 'SECRET'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  # config.action_controller.session_store = :active_record_store
end

