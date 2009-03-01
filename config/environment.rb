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
    :secret      => 'SECRET'
  }

end

require 'configatron'
configatron.configure_from_yaml("config/config.yml", :hash => Rails.env)
TWITTER =  Twitter::Client.new(:login => configatron.twitter_login, :password => configatron.twitter_password) if configatron.twitter_use
