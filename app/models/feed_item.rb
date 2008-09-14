class FeedItem < ActiveRecord::Base
before_save :fill_defaults

  def fill_defaults
    self.link    = configatron.bookqueue.url
    self.author  = configatron.owner.name
  end
  
end
