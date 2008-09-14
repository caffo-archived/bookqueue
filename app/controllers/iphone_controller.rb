class IphoneController < ApplicationController

def current
   @current = Book.current
   render :layout => false
end

def next
  @next = Book.next
  render :layout => false
end

def finished
  @finished = Book.finished
  render :layout => false
end

def show
  @book = Book.find(params[:id])
  render :layout => false
end

end
