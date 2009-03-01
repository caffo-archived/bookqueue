# ENV['RAILS_ENV'] ||= 'production'

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.load_paths += Dir["#{RAILS_ROOT}/vendor/gems/**"].map do |dir| 
    File.directory?(lib = "#{dir}/lib") ? lib : dir
  end

    config.time_zone = 'UTC'
  
  # Your secret key for verifying cookie session data integrity.
  # If you change this key, all old sessions will become invalid!
  # Make sure the secret is at least 30 characters and all random, 
  # no regular words or you'll be exposed to dictionary attacks.
  config.action_controller.session = {
    :session_key => '_bookqueue_session',
    :secret      => 'SECRET1111111111111111111111111111111'
  }

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  # config.action_controller.session_store = :active_record_store
end

require 'configatron'
configatron.configure_from_yaml("config/config.yml", :hash => Rails.env)
TWITTER =  Twitter::Client.new(:login => configatron.twitter_login, :password => configatron.twitter_password) if configatron.twitter_use
