class UsersController < ApplicationController
  layout 'books'
  # render new.rhtml
  def new
    login_required if User.all.size > 0      
  end

  def create
    cookies.delete :auth_token
    reset_session
    @user = User.new(params[:user])
    @user.save!
    self.current_user = @user
    flash[:notice] = "Welcome to the bookqueue!"
    redirect_back_or_default('/books/new')
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

end
