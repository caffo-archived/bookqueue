class Book < ActiveRecord::Base
  STATUSES = [  ['finished',2], ['next',0], ['currently',1] ]
  before_update :update_status
  
  def days_taken
    if self.finished_on && self.started_on
      (self.finished_on.to_date - self.started_on.to_date).to_i
    end
  end
  
  def update_status
    if status == 2
      self.finished_on = Time.now
    elsif status == 1
      self.started_on = Time.now
    else
      self.created_at = Time.now
    end
  end  
  
  def rss_post
    if status == 2
      rss_finished_book
      twitter_finished_book
    elsif status == 1
      rss_started_book
      twitter_started_book
    else
      rss_new_book
      twitter_new_book
    end
  end
  
  def rss_new_book
    post = FeedItem.new
    post.title = "#{title}"
    post.body  = "'#{title}', by #{author} added to caffo's book queue."
    post.save
  end

  def rss_finished_book
    taken = self.days_taken
    post = FeedItem.new
    post.title = "#{title}"
    post.body  = "'#{title}', by #{author} - finished in #{days_taken} days"
    post.save
  end

  def rss_started_book
    post = FeedItem.new
    post.title = "#{title}"
    post.body  = "Started reading '#{title}', by #{author}"
    post.save
  end

  def twitter_new_book
    status = TWITTER.status(:post, "'#{title}', by #{author} added to caffo's book queue.")
  end

  def twitter_finished_book
    status = TWITTER.status(:post, "'#{title}', by #{author} - finished in #{days_taken} days")
  end
  
  def twitter_started_book
    status = TWITTER.status(:post, "Started reading '#{title}', by #{author}")
  end

end
