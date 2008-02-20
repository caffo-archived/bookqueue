class FeedItem < ActiveRecord::Base
before_save :fill_defaults

  def fill_defaults
    self.link    = 'http://books.nodecaf.org/'
    self.author = 'caffo'
  end
  
end
