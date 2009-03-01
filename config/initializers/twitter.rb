require('twitter')
require('twitter/console')

if configatron.twitter.use
TWITTER =  Twitter::Client.new(:login => configatron.twitter.login, :password => configatron.twitter.password)
end