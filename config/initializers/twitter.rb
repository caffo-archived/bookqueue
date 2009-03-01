require('twitter')
require('twitter/console')

if configatron.twitter_use
TWITTER =  Twitter::Client.new(:login => configatron.twitter_login, :password => configatron.twitter_password)
end