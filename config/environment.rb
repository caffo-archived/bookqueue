RAILS_GEM_VERSION = '2.0.2'
ENV['RAILS_ENV'] ||= 'production'

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.action_controller.session = { :session_key => "_myapp_session", :secret => "some secret phrase of at least 30 characters" }
  config.load_paths += Dir["#{RAILS_ROOT}/vendor/gems/**"].map do |dir| 
    File.directory?(lib = "#{dir}/lib") ? lib : dir
  end
end

require('twitter')
require('twitter/console')

twitter_config =  File.join(File.dirname(__FILE__), '..', 'config', 'twitter.yml')
TWITTER        = Twitter::Client.from_config(twitter_config)

