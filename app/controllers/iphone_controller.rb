class IphoneController < ApplicationController

def current
   @current = Book.find_all_by_state("current")
   render :layout => false
end

def next
  @next = Book.find_all_by_state("next")
  render :layout => false
end

def finished
  @finished = Book.find(:all, :conditions => ["state = 'finished'"], :order => "finished_on")
  render :layout => false
end

def show
  @book = Book.find(params[:id])
  render :layout => false
end

end
