class FeedItem < ActiveRecord::Base
before_save :fill_defaults

  def fill_defaults
    self.link    = configatron.bookqueue_url
    self.author  = configatron.owner_name
  end
  
end
