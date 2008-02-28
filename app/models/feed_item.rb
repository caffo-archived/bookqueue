class FeedItem < ActiveRecord::Base
before_save :fill_defaults

  def fill_defaults
    self.link    = APP_CONFIG['site_url']
    self.author  = APP_CONFIG['site_author']
  end
  
end
