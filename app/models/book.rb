class Book < ActiveRecord::Base
  STATUSES = ['next', 'current','finished']

  attr_accessor :new_status
  
  after_create  :create_media
  before_update :update_status
  
  acts_as_state_machine :initial => :next
  state :next
  state :current,  :enter  => Proc.new {|b| b.update_media("current")}
  state :finished, :enter  => Proc.new {|b| b.finished_on = Date.today; b.update_media("finished")}
  
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
  
  def days_taken
    if self.finished_on && self.started_on
      (self.finished_on.to_date - self.started_on.to_date).to_i
    end
  end
  
  
  def update_media(state)
    post       = FeedItem.new
    post.title = "#{title}"
    case state
      when "next"
        post.body  = "'#{title}', by #{author} added to caffo's book queue."
        status = TWITTER.status(:post, "'#{title}', by #{author} added to caffo's book queue.")
      when "current"
        post.body  = "Started reading '#{title}', by #{author}"
        status = TWITTER.status(:post, "Started reading '#{title}', by #{author}")        
      when "finished"
        taken = self.days_taken
        post.body  = "'#{title}', by #{author} - finished in #{days_taken} days"  
        status = TWITTER.status(:post, "'#{title}', by #{author} - finished in #{days_taken} days")
    end
    post.save
  end

  def update_status
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
