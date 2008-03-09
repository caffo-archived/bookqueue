class Book < ActiveRecord::Base
  STATUSES = ['next', 'current','finished']
  RATES    = ['1', '2', '3', '4', '5'] 
  
  attr_accessor :new_status
  
  after_create  :create_media
  before_update :update_status!
  
  has_one :cover
  
  acts_as_state_machine :initial => :next
  state :next
  state :current,  :enter  => Proc.new {|b| b.started_on  = Date.today; b.update_media("current")}
  state :finished, :enter  => Proc.new {|b| b.finished_on = Date.today
                                            b.days_taken  = b.calculate_days_taken
                                            b.update_media("finished")}
  
  event :finish do    
    transitions :from  => :current, :to => :finished
  end

  event :start_reading do
    transitions :from  => :next, :to      => :current
    transitions :from  => :finished, :to  => :current
  end

  event :stop_reading do
    transitions :from  => :current, :to => :next
  end  
  
  def calculate_days_taken
    if self.finished_on && self.started_on
      (self.finished_on.to_date - self.started_on.to_date).to_i
    end
  end
  
  
  def update_media(state)
    post       = FeedItem.new
    post.title = "#{title}"
    case state
      when "next"
        post.body  = "'#{title}', by #{author} added to #{APP_CONFIG['site_owner']}'s book queue."
        status = TWITTER.status(:post, "'#{title}', by #{author} added to #{APP_CONFIG['site_owner']}'s book queue.") if APP_CONFIG['send_twitter']
      when "current"
        post.body  = "Started reading '#{title}', by #{author}"
        status = TWITTER.status(:post, "Started reading '#{title}', by #{author}") if APP_CONFIG['send_twitter']
      when "finished"
        taken = self.days_taken
        post.body  = "'#{title}', by #{author} - finished in #{days_taken} days"  
        status = TWITTER.status(:post, "'#{title}', by #{author} - finished in #{days_taken} days") if APP_CONFIG['send_twitter']
    end
    post.save
  end

  def update_status!
    case self.new_status
      when "current"
        self.start_reading!
      when "finished"
        self.finish!
      when "next"
        self.stop_reading!
    end
  end

  def create_media
    self.update_media("next")
  end
end
